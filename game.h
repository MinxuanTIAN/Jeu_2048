#ifndef GAME_H
#define GAME_H

#include <QObject>
#include <QColor>
#include <QTime>
#include <QKeyEvent>
#include <iostream>
#include <string.h>

using namespace std;

class Game: public QObject
{
    Q_OBJECT
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
    //Q_INVOKABLE void newGame();
    Q_INVOKABLE int getScore() const { return score; }
    Q_INVOKABLE int getBestScore() ;/*const { return score_max; }*/
    Q_INVOKABLE void undo();

private:
    int board[4][4];
    int score = 0;
    int score_max = 0;
    int memory=0;   // to store the score of last ground
    int lastscore=0;
    int lastboard[4][4];


signals:
    void begin();
public slots:
    void slot_begin();

};

#endif // GAME_H
