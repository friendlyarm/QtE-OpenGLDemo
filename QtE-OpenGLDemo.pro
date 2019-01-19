TEMPLATE = app
TARGET = QtE-Demo

QT += quick widgets quickwidgets

SOURCES += main.cpp QtE-Demo/util.cpp QtE-Demo/boardtype_friendlyelec.cpp \
           fbitem.cpp mainwindow.cpp QtE-Demo/mainwidget.cpp  QtE-Demo/tft28lcd.cpp

HEADERS += QtE-Demo/util.h QtE-Demo/boardtype_friendlyelec.h \
           fbitem.h mainwindow.h QtE-Demo/mainwidget.h QtE-Demo/tft28lcd.h

INCLUDEPATH += QtE-Demo

RESOURCES += main.qrc

OTHER_FILES += test.qml

