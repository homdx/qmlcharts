QT += charts qml quick

SOURCES += \
    main.cpp

 #if defined(Q_OS_ANDROID)
 QMAKE_LINK += -nostdlib++
 #elif defined(Q_OS_LINUX)
 QMAKE_LINK += ''
 #elif defined(Q_OS_WIN)
 QMAKE_LINK += ''
 #else
 QMAKE_LINK += ''
 #endif

DEPENDS = "qtquickcontrols2"

RESOURCES += \
    resources.qrc

DISTFILES += \
    qml/qmlchart/*

target.path = $$[QT_INSTALL_EXAMPLES]/charts/qmlchart
INSTALLS += target
