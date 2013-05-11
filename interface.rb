=begin
** Form generated from reading ui file 'interface.ui'
**
** Created: Sat May 11 15:07:09 2013
**      by: Qt User Interface Compiler version 4.8.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

require 'Qt4'

class Ui_MainWindow
    attr_reader :aboutButton
    attr_reader :centralwidget
    attr_reader :verticalLayout_3
    attr_reader :horizontalLayout_2
    attr_reader :logo
    attr_reader :label_2
    attr_reader :verticalLayout_2
    attr_reader :mappings
    attr_reader :horizontalLayout
    attr_reader :horizontalSpacer_2
    attr_reader :loadMappings
    attr_reader :verticalLayout
    attr_reader :sequenceEdit
    attr_reader :horizontalLayout_3
    attr_reader :horizontalSpacer
    attr_reader :playButton
    attr_reader :stopButton
    attr_reader :verticalSpacer
    attr_reader :menubar
    attr_reader :menuHelp
    attr_reader :statusbar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(800, 733)
    @aboutButton = Qt::Action.new(mainWindow)
    @aboutButton.objectName = "aboutButton"
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @verticalLayout_3 = Qt::VBoxLayout.new(@centralwidget)
    @verticalLayout_3.objectName = "verticalLayout_3"
    @horizontalLayout_2 = Qt::HBoxLayout.new()
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @logo = Qt::Label.new(@centralwidget)
    @logo.objectName = "logo"
    @logo.maximumSize = Qt::Size.new(250, 100)
    @logo.pixmap = Qt::Pixmap.new(":/proteins/220px-Myoglobin.png")

    @horizontalLayout_2.addWidget(@logo)

    @label_2 = Qt::Label.new(@centralwidget)
    @label_2.objectName = "label_2"
    @font = Qt::Font.new
    @font.family = "Utopia"
    @font.pointSize = 36
    @font.bold = true
    @font.italic = true
    @font.weight = 75
    @label_2.font = @font

    @horizontalLayout_2.addWidget(@label_2)


    @verticalLayout_3.addLayout(@horizontalLayout_2)

    @verticalLayout_2 = Qt::VBoxLayout.new()
    @verticalLayout_2.objectName = "verticalLayout_2"
    @mappings = Qt::TextEdit.new(@centralwidget)
    @mappings.objectName = "mappings"

    @verticalLayout_2.addWidget(@mappings)

    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @horizontalSpacer_2 = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @horizontalLayout.addItem(@horizontalSpacer_2)

    @loadMappings = Qt::PushButton.new(@centralwidget)
    @loadMappings.objectName = "loadMappings"

    @horizontalLayout.addWidget(@loadMappings)


    @verticalLayout_2.addLayout(@horizontalLayout)


    @verticalLayout_3.addLayout(@verticalLayout_2)

    @verticalLayout = Qt::VBoxLayout.new()
    @verticalLayout.objectName = "verticalLayout"
    @sequenceEdit = Qt::TextEdit.new(@centralwidget)
    @sequenceEdit.objectName = "sequenceEdit"

    @verticalLayout.addWidget(@sequenceEdit)

    @horizontalLayout_3 = Qt::HBoxLayout.new()
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @horizontalSpacer = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @horizontalLayout_3.addItem(@horizontalSpacer)

    @playButton = Qt::PushButton.new(@centralwidget)
    @playButton.objectName = "playButton"

    @horizontalLayout_3.addWidget(@playButton)

    @stopButton = Qt::PushButton.new(@centralwidget)
    @stopButton.objectName = "stopButton"

    @horizontalLayout_3.addWidget(@stopButton)


    @verticalLayout.addLayout(@horizontalLayout_3)


    @verticalLayout_3.addLayout(@verticalLayout)

    @verticalSpacer = Qt::SpacerItem.new(20, 115, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @verticalLayout_3.addItem(@verticalSpacer)

    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 800, 22)
    @menuHelp = Qt::Menu.new(@menubar)
    @menuHelp.objectName = "menuHelp"
    mainWindow.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar

    @menubar.addAction(@menuHelp.menuAction())
    @menuHelp.addAction(@aboutButton)

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
    @label_2.text = Qt::Application.translate("MainWindow", "Aminobeats", nil, Qt::Application::UnicodeUTF8)
    @loadMappings.text = Qt::Application.translate("MainWindow", "Load Mappings", nil, Qt::Application::UnicodeUTF8)
    @playButton.text = Qt::Application.translate("MainWindow", "Play", nil, Qt::Application::UnicodeUTF8)
    @stopButton.text = Qt::Application.translate("MainWindow", "Stop", nil, Qt::Application::UnicodeUTF8)
    @menuHelp.title = Qt::Application.translate("MainWindow", "Help", nil, Qt::Application::UnicodeUTF8)
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
