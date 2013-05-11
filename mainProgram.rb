require 'Qt4'
require './interface.rb'

class Aminobeats < Qt::MainWindow

  def initialize(editMappings,playSequence,stopSequence)
    super()
    @control = Ui_MainWindow.new
    @control.setupUi(self)
    @control.loadMappings.connect(SIGNAL :clicked){self.chooseFile}
    @control.playButton.connect(SIGNAL :clicked){self.playMusic}
    @control.stopButton.connect(SIGNAL :clicked){self.stopMusic}
    @control.mappings.connect(SIGNAL :textChanged){self.updateMappings}
    @picker = Qt::FileDialog.new
    @editMappings = editMappings
    @playSequence = playSequence
    @stopSequence = stopSequence
    @logo = Qt::Pixmap.new "logo.png"
    @control.logo.setPixmap(@logo)
  end

  def chooseFile
    File.open(@picker.getOpenFileName){|file|
      @control.mappings.setPlainText(file.read)
    }    
    
  end

  def updateMappings
    @editMappings.yield @control.mappings.toPlainText
  end

  def stopMusic
    @stopSequence.yield
  end

  def playMusic
    @playSequence.yield @control.sequenceEdit.toPlainText
  end

end

def initApp(openFile,playSequence,stopSequence)
  app = Qt::Application.new ARGV
  win = Aminobeats.new(openFile,playSequence,stopSequence)
  win.show
  app.exec
end

stopPlay = Proc.new do
  printf "Stopped"
end

openFile = Proc.new do |f|
  printf f
end

initApp(openFile,openFile,stopPlay)
