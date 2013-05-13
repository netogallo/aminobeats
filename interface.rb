=begin
** Form generated from reading ui file 'interface.ui'
**
** Created: Mon May 13 23:01:49 2013
**      by: Qt User Interface Compiler version 4.8.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

require 'Qt4'

class Ui_MainWindow
    attr_reader :aboutButton
    attr_reader :centralwidget
    attr_reader :verticalLayout_2
    attr_reader :horizontalLayout_2
    attr_reader :logo
    attr_reader :label_2
    attr_reader :horizontalLayout_5
    attr_reader :horizontalLayout
    attr_reader :verticalLayout
    attr_reader :plot
    attr_reader :sequenceEdit
    attr_reader :aminosList
    attr_reader :horizontalLayout_3
    attr_reader :horizontalSpacer
    attr_reader :divisionCombo
    attr_reader :steps
    attr_reader :plotButton
    attr_reader :plotDistributionButton
    attr_reader :playButton
    attr_reader :stopButton
    attr_reader :notes
    attr_reader :verticalLayout_3
    attr_reader :notesLayout
    attr_reader :verticalSpacer
    attr_reader :statusbar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(800, 921)
    mainWindow.styleSheet = "#centralwidget{\n" \
"	background-image:url(dark-subtle-patterns/pattern4.jpg);\n" \
"}\n" \
"\n" \
"#aminosList, #sequenceEdit{\n" \
"\n" \
"	background:#333;\n" \
"}"
    @aboutButton = Qt::Action.new(mainWindow)
    @aboutButton.objectName = "aboutButton"
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @verticalLayout_2 = Qt::VBoxLayout.new(@centralwidget)
    @verticalLayout_2.objectName = "verticalLayout_2"
    @horizontalLayout_2 = Qt::HBoxLayout.new()
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @logo = Qt::Label.new(@centralwidget)
    @logo.objectName = "logo"
    @logo.maximumSize = Qt::Size.new(250, 100)

    @horizontalLayout_2.addWidget(@logo)

    @label_2 = Qt::Label.new(@centralwidget)
    @label_2.objectName = "label_2"
    @font = Qt::Font.new
    @font.family = "Courier 10 Pitch"
    @font.pointSize = 36
    @font.bold = false
    @font.italic = false
    @font.weight = 50
    @label_2.font = @font
    @label_2.styleSheet = "#label_2 {\n" \
"	color: #fff;\n" \
"	font: 36pt \"Courier 10 Pitch\";\n" \
"}"

    @horizontalLayout_2.addWidget(@label_2)


    @verticalLayout_2.addLayout(@horizontalLayout_2)

    @horizontalLayout_5 = Qt::HBoxLayout.new()
    @horizontalLayout_5.objectName = "horizontalLayout_5"

    @verticalLayout_2.addLayout(@horizontalLayout_5)

    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @verticalLayout = Qt::VBoxLayout.new()
    @verticalLayout.objectName = "verticalLayout"
    @plot = Qt::Label.new(@centralwidget)
    @plot.objectName = "plot"
    @plot.minimumSize = Qt::Size.new(0, 200)

    @verticalLayout.addWidget(@plot)

    @sequenceEdit = Qt::TextEdit.new(@centralwidget)
    @sequenceEdit.objectName = "sequenceEdit"
    @sequenceEdit.styleSheet = "#sequenceEdit {\n" \
"	color: #fff;\n" \
"}"

    @verticalLayout.addWidget(@sequenceEdit)

    @aminosList = Qt::Label.new(@centralwidget)
    @aminosList.objectName = "aminosList"
    @aminosList.minimumSize = Qt::Size.new(0, 40)
    @aminosList.styleSheet = ""
    @aminosList.textFormat = Qt::RichText
    @aminosList.wordWrap = true

    @verticalLayout.addWidget(@aminosList)

    @horizontalLayout_3 = Qt::HBoxLayout.new()
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @horizontalSpacer = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @horizontalLayout_3.addItem(@horizontalSpacer)

    @divisionCombo = Qt::ComboBox.new(@centralwidget)
    @divisionCombo.objectName = "divisionCombo"

    @horizontalLayout_3.addWidget(@divisionCombo)

    @steps = Qt::SpinBox.new(@centralwidget)
    @steps.objectName = "steps"
    @steps.minimum = 1
    @steps.maximum = 100
    @steps.value = 10

    @horizontalLayout_3.addWidget(@steps)

    @plotButton = Qt::PushButton.new(@centralwidget)
    @plotButton.objectName = "plotButton"

    @horizontalLayout_3.addWidget(@plotButton)

    @plotDistributionButton = Qt::PushButton.new(@centralwidget)
    @plotDistributionButton.objectName = "plotDistributionButton"

    @horizontalLayout_3.addWidget(@plotDistributionButton)

    @playButton = Qt::PushButton.new(@centralwidget)
    @playButton.objectName = "playButton"

    @horizontalLayout_3.addWidget(@playButton)

    @stopButton = Qt::PushButton.new(@centralwidget)
    @stopButton.objectName = "stopButton"

    @horizontalLayout_3.addWidget(@stopButton)


    @verticalLayout.addLayout(@horizontalLayout_3)


    @horizontalLayout.addLayout(@verticalLayout)

    @notes = Qt::Frame.new(@centralwidget)
    @notes.objectName = "notes"
    @notes.styleSheet = "#notes QLabel{\n" \
"	color:#fff;\n" \
"}"
    @notes.frameShape = Qt::Frame::StyledPanel
    @notes.frameShadow = Qt::Frame::Raised
    @verticalLayout_3 = Qt::VBoxLayout.new(@notes)
    @verticalLayout_3.objectName = "verticalLayout_3"
    @notesLayout = Qt::VBoxLayout.new()
    @notesLayout.objectName = "notesLayout"

    @verticalLayout_3.addLayout(@notesLayout)


    @horizontalLayout.addWidget(@notes)


    @verticalLayout_2.addLayout(@horizontalLayout)

    @verticalSpacer = Qt::SpacerItem.new(20, 115, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @verticalLayout_2.addItem(@verticalSpacer)

    mainWindow.centralWidget = @centralwidget
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar

    retranslateUi(mainWindow)

    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "MainWindow", nil, Qt::Application::UnicodeUTF8)
    @aboutButton.text = Qt::Application.translate("MainWindow", "About", nil, Qt::Application::UnicodeUTF8)
    @logo.text = ''
    @label_2.text = Qt::Application.translate("MainWindow", "Amino Sonic", nil, Qt::Application::UnicodeUTF8)
    @plot.text = ''
    @sequenceEdit.html = Qt::Application.translate("MainWindow", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Sans Serif'; font-size:10pt; font-weight:400; font-style:normal;\">\n" \
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @aminosList.text = ''
    @divisionCombo.insertItems(0, [Qt::Application.translate("MainWindow", "Greater", nil, Qt::Application::UnicodeUTF8),
        Qt::Application.translate("MainWindow", "Smaller", nil, Qt::Application::UnicodeUTF8)])
    @plotButton.text = Qt::Application.translate("MainWindow", "Plot Series", nil, Qt::Application::UnicodeUTF8)
    @plotDistributionButton.text = Qt::Application.translate("MainWindow", "Plot Distribution", nil, Qt::Application::UnicodeUTF8)
    @playButton.text = Qt::Application.translate("MainWindow", "Play", nil, Qt::Application::UnicodeUTF8)
    @stopButton.text = Qt::Application.translate("MainWindow", "Stop", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

if $0 == __FILE__
    a = Qt::Application.new(ARGV)
    u = Ui_MainWindow.new
    w = Qt::MainWindow.new
    u.setupUi(w)
    w.show
    a.exec
end
