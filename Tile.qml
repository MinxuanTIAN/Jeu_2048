import QtQuick 2.0

Item {
    id: tile
    width: 450/4
    height: 450/4
    property alias tileColor: rectangle.color
    property alias tileText: tileText.text
    property alias textColor: tileText.color

    Rectangle {
        id: rectangle
        color: "#b48a76"
        radius: 3
        anchors.margins: 3
        anchors.fill: parent

        Text {
            id: tileText
            x: 44
            y: 50
            font.family: "Arial"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 48
        }
    }
}
