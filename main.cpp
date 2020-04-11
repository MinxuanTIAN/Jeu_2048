
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QtQml>
#include "game.h"
int main(int argc, char *argv[])
{   
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    Game game;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("Game",&game);
    engine.load(url);

    return app.exec();

//    QApplication a(argc, argv);
//    MainWindow w;
//    w.show();
//    return a.exec();
}
