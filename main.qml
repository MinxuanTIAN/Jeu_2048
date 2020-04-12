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
    property alias bestScoreText: bestScore.text
    property alias scoreText: score.text
    title: qsTr("Jeu du 2048")


    /*Column*/
    Item {
        id: root
        x: 90
        y: 50
        width: 450
        height: 600
        anchors.verticalCenterOffset: -13
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
            scoreText=command.getScore();
            bestScoreText=command.getBestScore();
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



        // Principal components
        // Row
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

        //Row2
        Rectangle{
            id: row2
            y: 100
            width: 450
            height: 50
            color: "#e9c9c9"

            Button {
                id: undo
                x: 180
                y: 0
                width: 130
                height: 45
                text: qsTr("Undo")
                font.bold: true
                font.family: "Arial"
                font.pointSize: 10
                MouseArea {
                    id: undoMouseArea
                    x: 0
                    y: 0
                    width: 130
                    height: 45
                    onClicked: {
                        command.undo();
                        root.updateWindow();
                    }
                }
            }

            Button {
                id: newGame
                x: 320
                width: 130
                height: 45
                text: qsTr("New Game")
                font.pointSize: 10
                font.bold: true
                font.family: "Arial"

                MouseArea {
                    id: newGameMouseArea
                    x: 0
                    y: 0
                    width: 130
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
