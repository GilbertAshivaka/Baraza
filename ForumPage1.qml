import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Dialogs

Rectangle {
    id: forumPage1
    anchors.fill: parent
    color: "#c0bebe"

    signal closeClicked()

    MouseArea{
        id: forumPage1MA
        anchors.fill: parent
    }

    Rectangle{
        id: backRect
        width: 32
        height: 32
        radius: 4
        color: "#D2CBCB"
        anchors{
            left: parent.left
            leftMargin: 10
            top: parent.top
            topMargin: 10
        }

        Rectangle{
            id: backBtnRect
            width: 20
            height: 20
            radius: 4
            anchors.centerIn: parent
            color: "transparent"

            Image{
                id: back
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "assets/backArrow.png"
            }
        }

        MouseArea{
            id: backMA
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                backRect.color = "#E8E3E4"
            }
            onExited: {
                backRect.color = "#D2CBCB"
            }

            onClicked: {
                forumPage1.closeClicked()
                forumsBtn.defaultColor = "transparent"
                homeBtn.defaultColor = "#75bcb5b5"
            }
        }
    }

    Image {
        id: forumIcon
        source: "assets/kenya.png"
        width: 40
        height: 40
        fillMode: Image.PreserveAspectFit
        anchors{
            left: backRect.right
            leftMargin: 10
            verticalCenter: backRect.verticalCenter
        }
    }

    Text {
        id: forumTitle
        text: "Baraza Forum"
        anchors{
            verticalCenter: forumIcon.verticalCenter
            left: forumIcon.right
            leftMargin: 10
        }
        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.DemiBold
        elide: Text.ElideRight
        maximumLineCount: 1
    }

    ScrollView{
        id: forumSV
        anchors{
            top: forumTitle.bottom
            topMargin: 20
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        contentHeight: forum1Flow.flowItemHeight + 150

        ForumPage1Flow{
            id: forum1Flow
            width: forumSV.width
        }
    }
}











