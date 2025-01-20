import QtQuick
import QtQuick.Controls

Rectangle{
    id: billsTile
    property string billTitle: "Bill title here"
    property string billDescription: "Bill description here"
    property bool isSelected: false
    property string defaultColor: "transparent"


    width: parent.width* .95
    height: 140
    color: isSelected ? "#75bcb5b5" : defaultColor
    border.color: isSelected ? "#bcb7b7" : defaultColor
    radius: 4
    anchors{
        top: searchBox.bottom
        topMargin: 10
        horizontalCenter: parent.horizontalCenter
    }

    Text{
        id: titleText
        text: billTitle //"The Kenya Robotics and Artificial Intelligence Society Bill, 2023"
        anchors{
            top: parent.top
            topMargin: 10
            left: parent.left
            leftMargin: 10
            right: parent.right
            rightMargin: 8
        }
        font.pixelSize: 14
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.DemiBold
        elide: Text.ElideRight
        maximumLineCount: 1
    }

    Rectangle{
        id: billRect
        width: parent.width
        color: "transparent"
        anchors{
            top: titleText.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 20
        }

        Text{
            id: bill
            height: parent.height
            text: billDescription //"The Kenya Robotics and Artificial Intelligence Society Bill, 2023 is a comprehensive legislative framework designed to foster the growth of robotics and AI in Kenya. It aims to promote ethical and responsible innovation while providing guidelines for the development, deployment, and use of these technologies."
            anchors{
                top: parent.top
                topMargin: 7
                left: parent.left
                leftMargin: 10
                right: parent.right
                rightMargin: 8
            }
            font.pixelSize: 12
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Normal
            wrapMode: Text.WordWrap
            elide: Text.ElideRight
        }
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            isSelected = !isSelected
//            billTileSelected(billTitle)
        }
    }
}
