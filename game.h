#ifndef GAME_H
#define GAME_H

#include <QObject>
#include <QColor>
#include <QTime>
#include <QKeyEvent>
#include <iostream>
using namespace std;

class Game: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString sText READ ReadStartText NOTIFY begin)

public:
    Game(QObject *parent = nullptr);
    Q_INVOKABLE QColor tileColor(const int &i, const int &j);
    Q_INVOKABLE QColor textColor(const int &i, const int &j);
    Q_INVOKABLE QString tileText(const int &i, const int &j);
        Q_INVOKABLE void moveUp();
        Q_INVOKABLE void moveDown();
        Q_INVOKABLE void moveLeft();
        Q_INVOKABLE void moveRight();
        Q_INVOKABLE void newTile();
        Q_INVOKABLE int gameOver();
        Q_INVOKABLE int won();
        Q_INVOKABLE void newGame();

        QString ReadStartText();

//        Q_INVOKABLE void StepBack();
//        Q_INVOKABLE void StepForward();



//    bool isGameOver() const { return gameOver; }
//    int getScore() const { return score; }
//    Board* getBoard() const { return board; }

//    void restart();
//    void move(int direction);
//    bool won() const;
//

private:
    int board[4][4];
    int score = 0;
    int score_max = 0;
    int *score_liste;
    int store;
    int nb=0;
    QString Text_begin;


signals:
    void begin();
public slots:
    void slot_begin();

};

#endif // GAME_H
