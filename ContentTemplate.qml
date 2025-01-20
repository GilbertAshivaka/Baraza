import QtQuick
import QtQuick.Controls

Rectangle{
    id: contentTemplate
    width: 300
    height: 150
    color: "#D0C4D2"
    radius: 8
    clip: true

    property string category: "Category"
    property string contentTitle: "ContentTitle"
    property string views: "7,643"
    property string status: "In review"
    property var instruction1: null

    Text {
        id: contentCategory
        text: category
        font.pointSize: 10
        anchors{
            left: parent.left
            leftMargin: 10
            right: statusRect.left
            rightMargin: 10
            top: parent.top
            topMargin: 10
        }
        verticalAlignment: Text.AlignVCenter
        elide: 	Text.ElideRight
        maximumLineCount: 1
    }

    Rectangle{
        id: statusRect
        width: Math.max(60, statusText.width + 14)//ratingsText.width + 12
        height: 20
        radius: 25
        color: "#DBE0E7"
        anchors{
            right: parent.right
            rightMargin: 10
            top: parent.top
            topMargin: 10
        }

        Text {
            id: statusText
            text: status
            anchors{
                left: parent.left
                leftMargin: 8
                verticalCenter: parent.verticalCenter
            }

            font.pixelSize: 12
            verticalAlignment: Text.AlignVCenter
            color: "black"
        }
    }

    Text {
        id: contentTitleText
        text: contentTitle
        font.pointSize: 16
        width: parent.width
        anchors{
            top: contentCategory.bottom
            topMargin: 10
            left: contentCategory.left
            right: parent.right
            rightMargin: 10
        }
        wrapMode: Text.WordWrap
        elide: Text.ElideRight
        maximumLineCount: 3
    }

    Text {
        id: viewsNo
        text: qsTr("Views: " + views )
        font.pointSize: 10
        font.italic: true
        anchors{
            right: parent.right
            rightMargin: 10
            bottom: parent.bottom
            bottomMargin: 10
        }
        color: "gray"
    }

    MouseArea{
        id: contentTemplateMA
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            if(instruction1){
                instruction1()
            }
        }
    }
}









