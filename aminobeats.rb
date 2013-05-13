require 'Qt4'
require './interface.rb'
require 'gnuplot'

class Aminobeats < Qt::MainWindow

  @@plotfile = "./plot.png"

  @@aminos = "./mapping.map"

  @@aminosMap = {
    "Val" => [71,"V",:red],
    "Ile" => [72,"I",:red],
    "Leu" => [74,"L",:red],
    "Met" => [76,"M",:red],
    "Phe" => [77,"F",:red],
    "Trp" => [79,"W",:red],
    "Cys" => [81,"C",:red],
    "Ala" => [47,"A",:green],
    "Tyr" => [49,"Y",:green],
    "His" => [51,"H",:green],
    "Thr" => [53,"T",:green],
    "Ser" => [54,"S",:green],
    "Pro" => [56,"P",:green],
    "Gly" => [58,"G",:green],
    "Arg" => [59,"R",:green],
    "Lys" => [61,"K",:green],
    "Gln" => [63,"Q",:green],
    "Glu" => [65,"E",:green],
    "Asn" => [66,"N",:green],
    "Asp" => [68,"D",:green],
    "*" => [0,"",:black]
  }

  @@keyMap = {}

  def initialize(editMappings,playSequence,stopSequence,countHP,parseData)
    super()
    @control = Ui_MainWindow.new
    @control.setupUi(self)
    @control.playButton.connect(SIGNAL :clicked){self.playMusic}
    @control.stopButton.connect(SIGNAL :clicked){self.stopMusic}
    @control.plotButton.connect(SIGNAL :clicked){self.plotAmionacids}
    @control.plotDistributionButton.connect(SIGNAL :clicked){self.plotHistogram}
    @picker = Qt::FileDialog.new
    @editMappings = editMappings
    @playSequence = playSequence
    @stopSequence = stopSequence
    @logo = Qt::Pixmap.new "logo.png"
    @control.logo.setPixmap(@logo)
    @len = 10
    @countHP = Proc.new do |x|
      self.collectHP(x).size
    end      
    @parseData = parseData
    self.loadMappings
    self.updateMappings(nil,nil)
    self.createNotesMap
  end

  def createNotesMap

    @@aminosMap.each{|k,v|
      layout = Qt::HBoxLayout.new(@control.centralwidget)
      name = Qt::Label.new
      name.text = Qt::Application.translate("MainWindow", k, nil, Qt::Application::UnicodeUTF8)
      sel = Qt::SpinBox.new(@control.centralwidget)
      sel.value = v[0]
      sel.maximum = 128
      sel.connect(SIGNAL "valueChanged(int)"){|note|
        prev = @@aminosMap[k]
        prev[0] = note
        @@aminosMap[k] = prev
        self.updateMappings(note,k)
      }      
      layout.addWidget name
      layout.addWidget sel
      @control.notesLayout.addLayout layout
    }
    
  end

  def loadMappings 

    File.open(@@aminos){|file|
      @codes = file.read
    }
  end

  def collectHP arr
    #cutoff = @control.separator.value
    a = []
    case @control.divisionCombo.currentIndex
    when 0
      a = arr.find_all {|x| @@keyMap[x][2] == :red} # > cutoff}
    when 1
      a = arr.find_all {|x| @@keyMap[x][2] == :green} #x < cutoff}
    end
    a
  end

  def updateMappings(k,n)
    if k
      @@keyMap[n] = @@aminosMap[k]
    else
      @@aminosMap.each{|k,v|
        @@keyMap[v[0]] = v
      }
    end
    begin
      @editMappings.yield(@codes,@@aminosMap)
    rescue => e
      puts e
      printf "Error parsing mappings\n"
    end
  end

  def stopMusic
    begin
      @stopSequence.yield
    rescue => e
      printf "Error stopping playback\n"
    end
  end

  def makeDatapoints    

    it = 1
    xs = []
    ys = []
    acc = []

    t = @parseData.yield(@control.sequenceEdit.toPlainText)

    @len = @control.steps.value

    t.each do |x|
      acc << x
      if acc.size > @len
        acc.delete_at 0
      end

      #printf it

      if acc.size == @len
        xs << it
        it = it+1
        ys << (@countHP.yield(acc).to_f/@len.to_f)
      end
    end

    [xs,ys]
    
  end

  def plotAmionacids
    
    w = @control.plot.width
    h = @control.plot.height

    Gnuplot.open do |gp|
      Gnuplot::Plot.new( gp ) do |plot|
    
        x,y = makeDatapoints
        
        plot.terminal "png size #{w},#{h}"
        plot.output @@plotfile #File.expand_path(@@plotfile, __FILE__)

        plot.data << Gnuplot::DataSet.new( [x, y] ) do |ds|
          ds.with = "linespoints"
          ds.notitle
        end
      end
    end

    @control.plot.setPixmap Qt::Pixmap.new @@plotfile
  end

  def plotHistogram
    
    w = @control.plot.width
    h = @control.plot.height

    Gnuplot.open do |gp|
      Gnuplot::Plot.new( gp ) do |plot|
    
        x,y = makeDatapoints
        
        ys = {}
        y.each do |y|
          if ys[y] 
            ys[y] = ys[y] + 1
          else
            ys[y] = 0
          end
        end
        
        res = ys.sort_by do |k,v|
          k
        end
        
        xs = res.each do |a|
          a[0]
        end

        vs = res.each do |a|
          a[1]
        end

        plot.terminal "png size #{w},#{h}"
        plot.output @@plotfile #File.expand_path(@@plotfile, __FILE__)

        plot.data << Gnuplot::DataSet.new( [xs,vs] ) do |ds|
          ds.with = "linespoints"
          ds.notitle
        end
      end
    end

    @control.plot.setPixmap Qt::Pixmap.new @@plotfile
  end

  def updateList(ts)
    @control.aminosList.setTextFormat(Qt::RichText)
    @control.aminosList.text = ""
    ts.each{|t|
      if @@keyMap[t]
        tx = @control.aminosList.text == nil ? "" : @control.aminosList.text
        style = Proc.new {|x| tx}
        case @@keyMap[t][2]
        when :red
          style = Proc.new {|x| tx + '<span style="color:#FF0000">' + x + ' </span>'}
        when :green
          style = Proc.new {|x| tx + '<span style="color:#00FF00">' + x + ' </span>'}
        end
        @control.aminosList.text = (style.yield @@keyMap[t][1])
      end
    }
  end

  def playMusic
    begin
      t = @playSequence.yield @control.sequenceEdit.toPlainText
      self.updateList t
    rescue => e
      puts e
      printf "Error starting playback\n"
    end
  end

end

def initApp(editMappings,playSequence,stopSequence,parseData)

  countHP = Proc.new do |arr|
    
  end

  app = Qt::Application.new ARGV
  win = Aminobeats.new(editMappings,playSequence,stopSequence,countHP,parseData)
  win.show
  app.exec
end
