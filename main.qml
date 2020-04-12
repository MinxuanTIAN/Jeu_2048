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


    /*Column*/
    Item {
        id: root
        x: 90
        y: 50
        width: 450
        height: 600
        anchors.verticalCenterOffset: -34
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        focus: true
        property int iter;

        function clearWindow(){
            for(iter=0;iter<16;iter++){
                board.num.itemAt(iter).tileText="";
                board.num.itemAt(iter).tileColor="#CDC1B5";
            }
        }

        function updateWindow(){
            clearWindow();
            for(iter=0;iter<16;iter++){
                board.num.itemAt(iter).tileColor=command.tileColor(iter%4,iter/4);
                board.num.itemAt(iter).tileText=command.tileText(iter%4,iter/4);
                board.num.itemAt(iter).textColor=command.textColor(iter%4,iter/4);
            }
        }

        Keys.onPressed: {
            switch(event.key) {
            case Qt.Key_Up:
                command.moveUp();
                root.updateWindow();
                break;
            case Qt.Key_Down:
                command.moveDown();
                root.updateWindow();
                break;
            case Qt.Key_Left:
                command.moveLeft();
                root.updateWindow();
                break;
            case Qt.Key_Right:
                command.moveRight();
                root.updateWindow();
                break;
            default:
                break;
            }
            Game.newTile();
            root.updateWindow();
            if (command.gameOver()===1){
                gameOverMessageDialog.title = "Game Over"
                gameOverMessageDialog.text = "Game Over!"
                gameOverMessageDialog.visible = true
            }
            if (command.won()===1){
                winMessageDialog.title = "Win"
                winMessageDialog.text = "You win!"
                winMessageDialog.visible = true
            }

        }




        //        Row
        Rectangle {
            id: row1
            x: 0
            y: 0
            width: 450
            height: 100
            color: "#e9c9c9"

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
                    text: qsTr("0")
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
                    text: qsTr("0")
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

        //Row
        Rectangle{
            id: row2
            y: 100
            width: 450
            height: 50
            color: "#e9c9c9"

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
                        command.slot_begin();
                        root.updateWindow();
                    }
                }
            }


            //tiles
        }

        Rectangle {
            id: board
            x: 0
            y: 0
            width: 450
            height: 450
            color: "#808080"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            property var num: repeater

            Grid {
                id: grid
                transformOrigin: Item.Center
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: parent
                spacing: 0
                rows: 4
                columns: 4

                Repeater {
                    id: repeater
                    model: parent.rows*parent.columns
                    Tile {
                        width: grid.width / grid.rows
                        height: grid.height / grid.columns
                    }
                }
            }

        }


        //    Rectangle {
        //        id: backgroud
        //        x: -37
        //        y: 165
        //        width: 540
        //        height: 474
        //        color: "#d69090"

        //        Rectangle {
        //            id: tile1
        //            x: 10
        //            y: 8
        //            width: 125
        //            height: 110
        //            color: command.tileColor(0,0)

        //            Text {
        //                id: text1
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(0,0)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile2
        //            x: 142
        //            y: 8
        //            width: 125
        //            height: 110
        //            color: command.tileColor(1,0)

        //            Text {
        //                id: text2
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(1,0)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile3
        //            x: 273
        //            y: 8
        //            width: 125
        //            height: 110
        //            color: command.tileColor(2,0)

        //            Text {
        //                id: text3
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(2,0)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile4
        //            x: 404
        //            y: 8
        //            width: 125
        //            height: 110
        //            color: command.tileColor(3,0)

        //            Text {
        //                id: text4
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(3,0)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile5
        //            x: 10
        //            y: 124
        //            width: 125
        //            height: 110
        //            color: command.tileColor(0,1)

        //            Text {
        //                id: text5
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(0,1)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile6
        //            x: 142
        //            y: 124
        //            width: 125
        //            height: 110
        //            color: command.tileColor(1,1)

        //            Text {
        //                id: text6
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(1,1)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile7
        //            x: 273
        //            y: 124
        //            width: 125
        //            height: 110
        //            color: command.tileColor(1,2)

        //            Text {
        //                id: text7
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(1,2)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile8
        //            x: 404
        //            y: 124
        //            width: 125
        //            height: 110
        //            color: command.tileColor(1,3)

        //            Text {
        //                id: text8
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(1,3)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile9
        //            x: 10
        //            y: 240
        //            width: 125
        //            height: 110
        //            color: command.tileColor(0,2)

        //            Text {
        //                id: text9
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(0,2)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile10
        //            x: 142
        //            y: 240
        //            width: 125
        //            height: 110
        //            color: command.tileColor(1,2)

        //            Text {
        //                id: text10
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(1,2)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile11
        //            x: 273
        //            y: 240
        //            width: 125
        //            height: 110
        //            color: command.tileColor(2,2)

        //            Text {
        //                id: text11
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(2,2)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile12
        //            x: 404
        //            y: 240
        //            width: 125
        //            height: 110
        //            color: command.tileColor(3,2)

        //            Text {
        //                id: text12
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(3,2)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile13
        //            x: 10
        //            y: 356
        //            width: 125
        //            height: 110
        //            color: command.tileColor(0,3)

        //            Text {
        //                id: text13
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(0,3)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile14
        //            x: 142
        //            y: 356
        //            width: 125
        //            height: 110
        //            color: command.tileColor(1,3)

        //            Text {
        //                id: text14
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(1,3)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }

        //        Rectangle {
        //            id: tile15
        //            x: 273
        //            y: 356
        //            width: 125
        //            height: 110
        //            color: command.tileColor(2,3)

        //            Text {
        //                id: text15
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 1
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(2,3)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }

        //    }

        //        Rectangle {
        //            id: tile16
        //            x: 404
        //            y: 356
        //            width: 125
        //            height: 110
        //            color: command.tileColor(3,3)

        //            Text {
        //                id: text16
        //                font.family: "Verdana"
        //                font.bold: true
        //                x: 0
        //                y: 0
        //                width: 125
        //                height: 110
        //                text: "#command.tileText(3,3)#"
        //                verticalAlignment: Text.AlignVCenter
        //                horizontalAlignment: Text.AlignHCenter
        //                font.pixelSize: 15
        //            }
        //        }
        MessageDialog {
            id: gameOverMessageDialog
            visible: false
            onAccepted: {
                command.newGame();
                root.updateWindow();
            }
        }
        MessageDialog {
            id: winMessageDialog
            visible: false
            onAccepted: {
                command.newGame();
                root.updateWindow();
            }
        }



    }


}

