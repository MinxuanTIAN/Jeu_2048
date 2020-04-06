import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.14

Window {
    id: mainWindow
    visible: true
    width: 550
    height: 700
    color: "#fff4c9"
    title: qsTr("Jeu du 2048")


    Column {
        id: column
        x: 90
        y: 50
        width: 450
        height: 600
        anchors.verticalCenterOffset: 0
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
            }
        }
        //tiles

        Rectangle {
            id: rectangle
            width: 450
            height: 450
            color: "#808080"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            Grid {
                id: grid
                anchors.fill: parent
                spacing: 0
                rows: 4
                columns: 4

                Repeater {
                    model: parent.rows*parent.columns
                    Tile {
                        width: grid.width / grid.rows
                        height: grid.height / grid.columns
                    }
                }
            }

        }



    }

}
