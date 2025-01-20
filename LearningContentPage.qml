import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Dialogs
import QtWebEngine

Rectangle {
    id: learningContentPage
    anchors.fill: parent
    color: "#F5F5F5"

    signal closeClicked()

    MouseArea {
        id: learningContentPageMA
        anchors.fill: parent
    }

    Rectangle {
        id: backRect
        width: 32
        height: 32
        radius: 4
        color: "#D2CBCB"
        anchors {
            left: parent.left
            leftMargin: 10
            verticalCenter: optionsContainer.verticalCenter
        }

        Rectangle {
            id: backBtnRect
            width: 20
            height: 20
            radius: 4
            anchors.centerIn: parent
            color: "transparent"

            Image {
                id: back
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "assets/backArrow.png"
            }
        }

        MouseArea {
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
                learningContentPage.closeClicked()
            }
        }
    }

    Rectangle {
        id: userProfileRect
        height: 50
        width: height
        radius: width/2
        clip: true
        anchors{
            top: parent.top
            topMargin: 10
            right: parent.right
            rightMargin: 16
        }

        color: "transparent"

        Image {
            id: sourceItem
            source: userImageSource
            anchors.centerIn: parent
            width: parent.width //* 0.4688
            height: width
            visible: false
            fillMode: Image.PreserveAspectCrop
        }

        MultiEffect {
            source: sourceItem
            anchors.fill: sourceItem
            maskEnabled: true
            maskSource: mask
        }

        Item {
            id: mask
            width: sourceItem.width
            height: sourceItem.height
            layer.enabled: true
            visible: false

            Rectangle {
                width: sourceItem.width
                height: sourceItem.height
                radius: width / 2
                color: "black"
            }
        }

        FileDialog {
            id: fileDialog
            title: "Select Profile Picture"
            nameFilters: ["Image files (*.png *.jpg *.jpeg *.gif)"]
            onAccepted: {
                if (fileDialog.currentFile) {
                    var fileUrl = fileDialog.currentFile
                    console.log("Selected file:", fileUrl)
                    userImageSource = fileUrl
                }
            }
            onRejected: {
                console.log("Canceled")
            }
        }

        MouseArea {
            anchors.fill: sourceItem
            cursorShape: "PointingHandCursor"
            onClicked: fileDialog.open()
            hoverEnabled: true
        }
    }

    Rectangle {
        id: optionsContainer
        width: 90
        height: 36
        color: "#75bcb5b5"
        radius: 4
        anchors{
            right: userProfileRect.left
            rightMargin: 20
            verticalCenter: userProfileRect.verticalCenter
        }

        Image {
            id: infoIcon
            source: "assets/learnInfo.png"
            height: 20
            width: 20
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 10
            }
            MouseArea{
                id: infoIconMA
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                hoverEnabled: true
                onEntered: {
                    menuTT.visible = false
                    infoTT.visible = !infoTT.visible
                }
                onExited: {
                    infoTT.visible = !infoTT.visible
                }
            }
            ToolTip{
                id: infoTT
               x: infoIconMA.mouseX +10
               y: infoIconMA.mouseY +20
               visible: false
               delay: 1000
               text: "About"
               dim: true
               timeout: 5000
            }
        }

        Image {
            id: menuIcon
            source: "assets/menu.png"
            width: 30
            height: 20
            anchors{
                verticalCenter: parent.verticalCenter
                right: infoIcon.left
                rightMargin: 10
            }
            MouseArea{
                id: menuIconMA
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                hoverEnabled: true
                onEntered: {
                    infoTT.visible = false
                    menuTT.visible = !menuTT.visible
                }
                onExited: {
                    menuTT.visible = !menuTT.visible
                }
                onClicked: {
                    optionsMenu.open()
                }
            }

            ToolTip{
                id: menuTT
               x: menuIconMA.mouseX +10
               y: menuIconMA.mouseY +20
               visible: false
               delay: 1000
               text: "More options"
               dim: true
               timeout: 5000
            }

            Menu{
                id: optionsMenu
                width: 100
                y: menuIcon.height
                MenuItem{
                    text:"Back to lessons"
                }
                MenuItem{
                    text:"Bookmarks"
                }
                MenuItem{
                    text:"Add to favorites"
                }
                MenuItem{
                    text:"Recent lessons"
                }
            }
        }
    }

    Rectangle{
        id: lessonTitleRect
        height: 40
        color: "transparent"
        anchors{
            left: backRect.right
            leftMargin: 10
            right: optionsContainer.left
            rightMargin: 10
            verticalCenter: optionsContainer.verticalCenter
        }

        Text {
            id: lessonBigTitleText
            text: lessonWebView.title //qsTr("The Kenya Robotics and Artificial Intelligence Society Bill, 2023")
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 10
            }
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.DemiBold
            elide: Text.ElideRight
            maximumLineCount: 1
        }
    }

    Rectangle{
        id: lessonProgressBar
        width: parent.width
        height: 4
        radius: 25
        color: "#FBFBFB"
        anchors{
            top: lessonTitleRect.bottom
            topMargin: 8
            horizontalCenter: parent.horizontalCenter
        }

        Rectangle{
            id: progressBarFill
            width: lessonProgressBar.width* .50
            height: lessonProgressBar.height
            radius: 25
            //give it a gradient blue color
            gradient: Gradient{
                GradientStop{position: 0.0; color: "#4A90E2"}
                GradientStop{position: 1.0; color: "#36D1DC"}
            }
            anchors{
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
        }
    }

    Rectangle{
        id: lessonContent
        anchors{
            top: lessonProgressBar.bottom
            topMargin: 4
            bottom: parent.bottom
            right: parent.right
            left: parent.left
        }

        WebEngineView{
            id: lessonWebView
            anchors.fill: parent
            url: Qt.resolvedUrl("assets/Lesson1.html") //Qt.resolvedUrl(billArray[0]) //Qt.resolvedUrl("assets/group5.html")
            onLoadingChanged: {
                if(loadProgress === 100){
                    lessonBigTitleText.text = lessonWebView.title
                }
            }
        }
    }
}
