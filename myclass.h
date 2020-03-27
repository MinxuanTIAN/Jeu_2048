#ifndef MYCALSS_H
#define MYCALSS_H


#include <QObject>
class MyClass : public QObject
{
    Q_OBJECT
public:
    explicit MyClass(QObject *parent=0);

signals:

public slots:
    void aboutQt();

};

#endif // MYCALSS_H
