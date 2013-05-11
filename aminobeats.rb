require 'Qt4'
require './interface.rb'
require 'gnuplot'

class Aminobeats < Qt::MainWindow

  @@plotfile = "./plot.png"

  def initialize(editMappings,playSequence,stopSequence,countHP)
    super()
    @control = Ui_MainWindow.new
    @control.setupUi(self)
    @control.loadMappings.connect(SIGNAL :clicked){self.chooseFile}
    @control.playButton.connect(SIGNAL :clicked){self.playMusic}
    @control.stopButton.connect(SIGNAL :clicked){self.stopMusic}
    @control.mappings.connect(SIGNAL :textChanged){self.updateMappings}
    @control.plotButton.connect(SIGNAL :clicked){self.plotAmionacids}
    @picker = Qt::FileDialog.new
    @editMappings = editMappings
    @playSequence = playSequence
    @stopSequence = stopSequence
    @logo = Qt::Pixmap.new "logo.png"
    @control.logo.setPixmap(@logo)
    @len = 10
    @countHP = countHP
  end

  def chooseFile
    File.open(@picker.getOpenFileName){|file|
      @control.mappings.setPlainText(file.read)
    }    
    
  end

  def updateMappings
    begin
      @editMappings.yield @control.mappings.toPlainText
    rescue => e
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

    t = @control.sequenceEdit.toPlainText()

    t.split("").each do |x|
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

  def playMusic
    begin
      @playSequence.yield @control.sequenceEdit.toPlainText
    rescue => e
      printf "Error starting playback\n"
    end
  end

end

def initApp(editMappings,playSequence,stopSequence)

  countHP = Proc.new do |arr|
    a = arr.find_all {|x| x == '1'}
    a.size
  end

  app = Qt::Application.new ARGV
  win = Aminobeats.new(editMappings,playSequence,stopSequence,countHP)
  win.show
  app.exec
end
