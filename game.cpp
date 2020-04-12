#include "game.h"
#include<iostream>
using namespace std;

Game::Game(QObject *parent): QObject(parent)
{
   Text_begin = "New Game";
   begin();
   for (int i = 0; i < 4; i++){
       for (int j = 0; j < 4; j++){
           board[i][j]=0;
       }
   }
   // random seed
   qsrand(uint(QTime(0,0,0).secsTo(QTime::currentTime())));
}


QString Game::readStartText()
{
    return Text_begin;
}

void Game::slot_begin(){
    score=0;
    for (int i = 0; i < 4 ; i++) {
        for (int j = 0; j < 4; j++) {
            board[i][j]=0;
        }
    }
    Text_begin="Start again";
    begin();
    int randi1=qrand()%4; // random number between 0 and 3
    int randj1=qrand()%4;
    board[randi1][randj1]=2;
    int randi2=randi1;
    int randj2=randj1;
    while (randi2==randi1 && randj2==randj1){
        randi2=qrand()%4;
        randj2=qrand()%4;
    }
    board[randi2][randj2]=2;
}


QColor Game::tileColor(const int &i, const int &j){
    QColor TileColor;
    if (board[i][j]==0){
        TileColor=QColor(205,193,181);
    }
    else if (board[i][j]==2){
        TileColor=QColor(238,228,218);
    }
    else if (board[i][j]==4){
        TileColor=QColor(237,224,201);
    }
    else if (board[i][j]==8){
        TileColor=QColor(243,177,124);
    }
    else if (board[i][j]==16){
        TileColor=QColor(246,149,102);
    }
    else if (board[i][j]==32){
        TileColor=QColor(247,124,96);
    }
    else if (board[i][j]==64){
        TileColor=QColor(247,94,61);
    }
    else if (board[i][j]==128){
        TileColor=QColor(238,207,120);
    }
    else if (board[i][j]==256){
        TileColor=QColor(238,204,104);
    }
    else if (board[i][j]==512){
        TileColor=QColor(238,200,89);
    }
    else if (board[i][j]==1024){
        TileColor=QColor(234,88,59);
    }
    else if (board[i][j]==2048){
        TileColor=QColor(253,249,55);
    }
    return TileColor;
}

QColor Game::textColor(const int &i, const int &j){
    QColor TextColor;
    if (board[i][j]==0){
    }
    else if (board[i][j]==2){
        TextColor=QColor(119,110,101);
    }
    else if (board[i][j]==4){
        TextColor=QColor(119,110,101);
    }
    else if (board[i][j]==8){
        TextColor=QColor(255,255,255);
    }
    else if (board[i][j]==16){
        TextColor=QColor(255,255,255);
    }
    else if (board[i][j]==32){
        TextColor=QColor(255,255,255);
    }
    else if (board[i][j]==64){
        TextColor=QColor(255,255,255);
    }
    else if (board[i][j]==128){
        TextColor=QColor(255,255,255);
    }
    else if (board[i][j]==256){
        TextColor=QColor(119,110,101);
    }
    else if (board[i][j]==512){
        TextColor=QColor(119,110,101);
    }
    else if (board[i][j]==1024){
        TextColor=QColor(119,110,101);
    }
    else if (board[i][j]==2048){
        TextColor=QColor(119,110,101);
    }
    return TextColor;
}


QString Game::tileText(const int &i, const int &j){
    QString text;
    if (board[i][j]!=0){
        text = QString::number(board[i][j]);
    }
    return text;
}


void Game::moveUp()
{

    // move
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            if (board[i][j]!=0){
                for (int k = 0; k < j; k++) {
                    if (board[i][k]==0){
                        board[i][k]=board[i][j];
                        board[i][j]=0;
                        break;
                    }
                }
            }
        }
    }
    // add
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 3; j++) {
            if (board[i][j]==board[i][j+1]){
                board[i][j]=2*board[i][j];
                board[i][j+1]=0;
                score+=board[i][j];
                for (int k = j+2; k < 4; k++) {
                    board[i][k-1]=board[i][k];
                }
            }
        }
    }
//    save();
}

void Game::moveDown()
{
    // move
    for (int i = 0; i < 4; i++) {
        for (int j = 2; j >= 0; j--) {
            if (board[i][j]!=0){
                for (int k = 3; k > j; k--) {
                    if (board[i][k]==0){
                        board[i][k]=board[i][j];
                        board[i][j]=0;
                        break;
                    }
                }
            }
        }
    }
    // add
    for (int i = 0; i < 4; i++) {
        for (int j = 3; j > 0; j--) {
            if (board[i][j]==board[i][j-1]){
                board[i][j]=2*board[i][j];
                board[i][j-1]=0;
                score+=board[i][j];
                for (int k = j-2; k >= 0; k--) {
                    board[i][k+1]=board[i][k];
                }
            }
        }
    }
    //save();
}

void Game::moveLeft()
{
    // move
    for (int j = 0; j < 4; j++) {
        for (int i = 0; i < 4; i++) {
            if (board[i][j]!=0){
                for (int k = 0; k < i; k++) {
                    if (board[k][j]==0){
                        board[k][j]=board[i][j];
                        board[i][j]=0;
                        break;
                    }
                }
            }
        }
    }
    // add
    for (int j = 0; j < 4; j++) {
        for (int i = 0; i < 4; i++) {
            if (board[i][j]==board[i+1][j]){
                board[i][j]=2*board[i][j];
                board[i+1][j]=0;
                score+=board[i][j];
                for (int k = i+2; k < 4; k++) {
                    board[k-1][j]=board[k][j];
                }
            }
        }
    }
    //save();
}

void Game::moveRight()
{
    // move
    for (int j = 0; j < 4; j++) {
        for (int i = 2; i >= 0; i--) {
            if (board[i][j]!=0){
                for (int k = 3; k > i; k--) {
                    if (board[k][j]==0){
                        board[k][j]=board[i][j];
                        board[i][j]=0;
                        break;
                    }
                }
            }
        }
    }
    // add
    for (int j = 0; j < 4; j++) {
        for (int i = 3; i > 0; i--) {
            if (board[i][j]==board[i-1][j]){
                board[i][j]=2*board[i][j];
                board[i-1][j]=0;
                score+=board[i][j];
                for (int k = i-2; k >= 0; k--) {
                    board[k+1][j]=board[k][j];
                }
            }
        }
    }
    //save();
}

void Game::newTile()
{
    // find the empty tiles
    int num=0;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            if (board[i][j]==0){
                num++;
            }
        }
    }
    //
    if (num!=0){
        int randi=qrand()%4;
        int randj=qrand()%4;

        while (board[randi][randj]!=0) {
            randi=qrand()%4;
            randj=qrand()%4;
        }
        board[randi][randj]=2;
    }
}

int Game::gameOver()
{
    int num = 0;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            if (board[i][j]==0){
                num++;
            }
        }
    }

    // game is over?

 //    if (num==0){return 1;}
 //    else return 0;

    if (num==0){
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3; j++) {
               if(board[i][j]==board[i][j+1]){
                 return 0;   //game not over
                }
            }
        }
        for (int j = 0; j < 4; j++) {
          for (int i = 0; i < 3; i++) {
               if(board[i][j]==board[i+1][j]){
                  return 0;  //game not over
            }
           }
       }
      return 1;   //game over
  }
}


int Game::won()
{
    for (int i = 0; i < 4; i++){
        for (int j = 0; j < 4; j++){
            if (board[i][j]==2048){
                return 1;   //game won
            }
        }
    }
    return 0;
}

void Game::newGame()
{
    Text_begin="New game";
    begin();
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            board[i][j]=0;
        }
    }
    //save();
}

//void Game::stepBack()
//{
//    if(!forwardValid){
//        while(!forwardState.empty()){
//            Board *tmp = forwardState.top();
//            forwardState.pop();
//            delete tmp;
//        }
//    }

//    if(!backState.empty()){
//        forwardValid = true;
//        forwardState.push(board);

//        board = new Board(*(backState.back()));
//        backState.pop_back();
//        score = board->getScore();
//    }
//    notifyObservers();
//}

//void Game::stepForward()
//{
//    std::cout << "forwarding... " <<forwardState.size()<< std::endl;
//    if(forwardValid && !forwardState.empty()){
//        //Board *tmp = new Board(*board);
//        backState.push_back(board);
//        //delete board;
//        board = forwardState.top();
//        forwardState.pop();
//        score = board->getScore();
//    }
//    notifyObservers();
//}
