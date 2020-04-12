
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QtQml>
#include "game.h"
int main(int argc, char *argv[])
{   
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    Game g;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("command",&g);
    engine.load(url);

    return app.exec();

//    QApplication a(argc, argv);
//    MainWindow w;
//    w.show();
//    return a.exec();
}
