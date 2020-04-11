import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.14
import QtQuick.Dialogs 1.1


Window {
    id: mainWindow
    visible: true
    width: 560
    height: 750
    color: "#fff4c9"
    title: qsTr("Jeu du 2048")


    Column {
        id: column
        x: 90
        y: 50
        width: 466
        height: 574
        anchors.verticalCenterOffset: -34
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Row {
            id: row1
            width: 450
            height: 100

            Text {
                id: gameName
                width: 150
                height: 60
                color: "#8f480a"
                text: qsTr("2048")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
                font.bold: true
                font.family: "Arial"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 48
            }

            Rectangle {
                id: scoreBoard
                width: 130
                height: 80
                color: "#8f480a"
                radius: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 140

                Text {
                    id: textScore
                    width: 130
                    height: 40
                    color: "#fff4c9"
                    text: qsTr("Score:")
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Arial"
                    font.pixelSize: 30
                }
                Text {
                    id: score
                    width: 130
                    height: 40
                    color: "#fff4c9"
                    text: score
                    font.family: "Arial"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    font.pixelSize: 30
                }
            }

            Rectangle {
                id: bestBoard
                width: 130
                height: 80
                color: "#8f480a"
                radius: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 0

                Text {
                    id: textBest
                    width: 130
                    height: 40
                    color: "#fff4c9"
                    text: qsTr("Best:")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 30
                    font.family: "Arial"
                    font.bold: true
                }

                Text {
                    id: bestScore
                    width: 130
                    height: 40
                    color: "#fff4c9"
                    text: bestScore
                    font.family: "Arial"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    font.pixelSize: 30
                }
            }

        }


        Row {
            id: row2
            y: 100
            width: 450
            height: 50

            Text {
                id: instruction
                width: 320
                height: 50
                color: "#000000"
                text: qsTr("Join the numbers and get to the 2048 tile!")
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                font.italic: true
                anchors.left: parent.left
                anchors.leftMargin: 0
                font.family: "Arial"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 16
            }

            Button {
                id: newGame
                width: 120
                height: 45
                text: qsTr("New Game")
                font.pointSize: 10
                anchors.right: parent.right
                anchors.rightMargin: 0
                font.bold: true
                font.family: "Arial"

                MouseArea {
                    id: newGameMouseArea
                    x: 0
                    y: 0
                    width: 120
                    height: 45
                    onClicked: {
                        Game.slot_begin();
                        root.updateWindow();
                    }
            }
        }


        //tiles

        function updateWindow(){
//            clearWindow();
            tile1.color = Game.tileColor(0,0);
            text1.text = Game.tileText(0,0);
            text1.color = Game.textColor(0,0);

            tile2.color = Game.tileColor(1,0);
            text2.text = Game.tileText(1,0);
            text2.color = Game.textColor(1,0);

            tile3.color = Game.tileColor(2,0);
            text3.text = Game.tileText(2,0);
            text3.color = Game.textColor(2,0);

            tile4.color = Game.tileColor(3,0);
            text4.text = Game.tileText(3,0);
            text4.color = Game.textColor(3,0);

            tile5.color = Game.tileColor(0,1);
            text5.text = Game.tileText(0,1);
            text5.color = Game.textColor(0,1);

            tile6.color = Game.tileColor(1,1);
            text6.text = Game.tileText(1,1);
            text6.color = Game.textColor(1,1);

            tile7.color = Game.tileColor(2,1);
            text7.text = Game.tileText(2,1);
            text7.color = Game.textColor(2,1);

            tile8.color = Game.tileColor(3,1);
            text8.text = Game.tileText(3,1);
            text8.color = Game.textColor(3,1);

            tile9.color = Game.tileColor(0,2);
            text9.text = Game.tileText(0,2);
            text9.color = Game.textColor(0,2);

            tile10.color = Game.tileColor(1,2);
            text10.text = Game.tileText(1,2);
            text10.color = Game.textColor(1,2);

            tile11.color = Game.tileColor(2,2);
            text11.text = Game.tileText(2,2);
            text11.color = Game.textColor(2,2);

            tile12.color = Game.tileColor(3,2);
            text12.text = Game.tileText(3,2);
            text12.color = Game.textColor(3,2);

            tile13.color = Game.tileColor(0,3);
            text13.text = Game.tileText(0,3);
            text13.color = Game.textColor(0,3);

            tile14.color = Game.tileColor(1,3);
            text14.text = Game.tileText(1,3);
            text14.color = Game.textColor(1,3);

            tile15.color = Game.tileColor(2,3);
            text15.text = gGame.tileText(2,3);
            text15.color = Game.textColor(2,3);

            tile16.color = Game.tileColor(3,3);
            text16.text = Game.tileText(3,3);
            text16.color = Game.textColor(3,3);
        }


        Keys.onPressed: {
            switch(event.key) {
            case Qt.Key_Up:
                Game.moveUp();
                root.updateWindow();
                break;
            case Qt.Key_Down:
                Game.moveDown();
                root.updateWindow();
                break;
            case Qt.Key_Left:
                Game.moveLeft();
                root.updateWindow();
                break;
            case Qt.Key_Right:
                Game.moveRight();
                root.updateWindow();
                break;
            default:
                break;
            }
            Game.newTile();
            root.updateWindow();
            if (Game.gameOver()===1){
                gameOverMessageDialog.title = "Game Over"
                gameOverMessageDialog.text = "Game Over!"
                gameOverMessageDialog.visible = true
            }
            if (gameController.won()===1){
                winMessageDialog.title = "Win"
                winMessageDialog.text = "You win!"
                winMessageDialog.visible = true
            }

        }







//        Rectangle {
//            id: rectangle
//            width: 450
//            height: 450
//            color: "#808080"
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 0

//            Grid {
//                id: grid
//                anchors.rightMargin: 0
//                anchors.bottomMargin: 0
//                anchors.leftMargin: 0
//                anchors.topMargin: 0
//                anchors.fill: parent
//                spacing: 0
//                rows: 4
//                columns: 4

//                Repeater {
//                    model: parent.rows*parent.columns
//                    Tile {
//                        width: grid.width / grid.rows
//                        height: grid.height / grid.columns
        //                    }
        //                }
        //            }

        //        }



    }

    Rectangle {
        id: backgroud
        x: 11
        y: 235
        width: 540
        height: 474
        color: "#cdbaba"

        Rectangle {
            id: tile1
            x: 10
            y: 8
            width: 125
            height: 110
            color: Game.tileColor(0,0)

            Text {
                id: text1
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(0,0)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile2
            x: 142
            y: 8
            width: 125
            height: 110
            color: Game.tileColor(1,0)

            Text {
                id: text2
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(1,0)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile3
            x: 273
            y: 8
            width: 125
            height: 110
            color: Game.tileColor(2,0)

            Text {
                id: text3
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(2,0)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile4
            x: 404
            y: 8
            width: 125
            height: 110
            color: Game.tileColor(3,0)

            Text {
                id: text4
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(3,0)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile5
            x: 10
            y: 124
            width: 125
            height: 110
            color: Game.tileColor(0,1)

            Text {
                id: text5
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(0,1)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile6
            x: 142
            y: 124
            width: 125
            height: 110
            color: Game.tileColor(1,1)

            Text {
                id: text6
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(1,1)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile7
            x: 273
            y: 124
            width: 125
            height: 110
            color: Game.tileColor(1,2)

            Text {
                id: text7
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(1,2)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile8
            x: 404
            y: 124
            width: 125
            height: 110
            color: Game.tileColor(1,3)

            Text {
                id: text8
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(1,3)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile9
            x: 10
            y: 240
            width: 125
            height: 110
            color: Game.tileColor(0,2)

            Text {
                id: text9
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(0,2)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile10
            x: 142
            y: 240
            width: 125
            height: 110
            color: Game.tileColor(1,2)

            Text {
                id: text10
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(1,2)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile11
            x: 273
            y: 240
            width: 125
            height: 110
            color: Game.tileColor(2,2)

            Text {
                id: text11
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(2,2)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile12
            x: 404
            y: 240
            width: 125
            height: 110
            color: Game.tileColor(3,2)

            Text {
                id: text12
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(3,2)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile13
            x: 10
            y: 356
            width: 125
            height: 110
            color: Game.tileColor(0,3)

            Text {
                id: text13
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(0,3)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile14
            x: 142
            y: 356
            width: 125
            height: 110
            color: Game.tileColor(1,3)

            Text {
                id: text14
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(1,3)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile16
            x: 404
            y: 356
            width: 125
            height: 110
            color: Game.tileColor(3,3)

            Text {
                id: text16
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(3,3)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: tile15
            x: 284
            y: 591
            width: 125
            height: 110
            color: Game.tileColor(2,3)

            Text {
                id: text15
                font.family: "Verdana"
                font.bold: true
                x: 0
                y: 0
                width: 125
                height: 110
                text: "#Game.tileText(2,3)#"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }

    }

        MessageDialog {
            id: gameOverMessageDialog
            visible: false
            onAccepted: {
                gameController.newGame();
                root.updateWindow();
            }
        }
        MessageDialog {
            id: winMessageDialog
            visible: false
            onAccepted: {
                gameController.newGame();
                root.updateWindow();
            }
        }


    }


  }
}
