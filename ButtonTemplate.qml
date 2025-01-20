import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import QtQuick.Effects

Item {
    id: tileTemplate
    property real tileWidth: 400
    property real tileHeight: 200
    property string userImageSource: "assets/background1.jpg"
    property string shareIcon: "assets/share.png"
    property string ellipsisIcon: "assets/ellipsis.png"
    property string titleText: "Tile Title"
    property string descriptionText: "Tile Description"
    property var instruction1: null


    width: tileWidth
    height: tileHeight

    Rectangle {
        id: buttonTemplate
        width: tileWidth
        height: tileHeight
        color: "transparent"
        border.width: 2
        border.color: "lightgray"
        radius: 16
        clip: true
        anchors.centerIn: parent

        Rectangle {
            id: button2
            height: parent.height - 4
            width: parent.width - 4
            radius: 16
            clip: true
            border.color: "white"
            border.width: 4
            anchors.centerIn: parent

            Image {
                id: sourceItem2
                source: userImageSource
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                visible: false
                fillMode: Image.PreserveAspectCrop
                smooth: true
            }

            MultiEffect {
                source: sourceItem2
                anchors.fill: sourceItem2
                maskEnabled: true
                maskSource: mask2
                smooth: true
            }

            Item {
                id: mask2
                width: sourceItem2.width
                height: sourceItem2.height
                layer.enabled: true
                visible: false

                Rectangle {
                    width: sourceItem2.width
                    height: sourceItem2.height
                    radius: 16
                    color: "black"
                }
            }

            FileDialog {
                id: fileDialog2
                title: "Select Profile Picture"
                nameFilters: ["Image files (*.png *.jpg *.jpeg *.gif)"]
                onAccepted: {
                    if (fileDialog2.currentFile) {
                        var fileUrl = fileDialog2.currentFile
                        console.log("Selected file:", fileUrl)
                        userImageSource2 = fileUrl
                    }
                }
                onRejected: {
                    console.log("Canceled")
                }
            }

            MouseArea {
                anchors.fill: sourceItem2
                onClicked: {
//                    fileDialog2.open()
                }
                hoverEnabled: true
            }

            Image {
                id: menuIcon2
                source: ellipsisIcon
                width: 16
                height: 16
                anchors {
                    right: parent.right
                    rightMargin: 16
                    top: parent.top
                    topMargin: 10
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                }
            }

            Image {
                id: shareIcon2
                source: shareIcon
                width: 16
                height: 16
                anchors {
                    right: menuIcon2.left
                    rightMargin: 7
                    top: menuIcon2.top
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                }
            }

            Rectangle {
                id: titleRect2
                width: parent.width * .98
                height: 50
                color: "transparent"
                clip: true
                anchors {
                    top: shareIcon2.bottom
                    topMargin: 5
                    left: parent.left
                    leftMargin: 8
                    right: parent.right
                    rightMargin: 8
                }

                Text {
                    id: button1Txt21
                    width: parent.width
                    height: parent.height
                    anchors {
                        left: parent.left
                        leftMargin: 8
                        top: parent.top
                    }
                    text: titleText
                    font.pixelSize: 16
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                }
            }

            Rectangle {
                id: separator2
                height: 1
                width: parent.width * .95
                anchors {
                    top: titleRect2.bottom
                    topMargin: 10
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: descriptionRect2
                width: parent.width * .98
                color: "transparent"
                clip: true
                anchors {
                    top: separator2.bottom
                    topMargin: 10
                    left: titleRect2.left
                    right: parent.right
                    rightMargin: 16
                    bottom: parent.bottom
                    bottomMargin: 20
                }

                Text {
                    id: button1Txt22
                    width: parent.width
                    anchors {
                        left: parent.left
                        leftMargin: 8
                        top: parent.top
                    }
                    text: descriptionText
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Normal
                    font.italic: true
                    color: "white"
                    wrapMode: Text.WordWrap
                    maximumLineCount: 3
                    elide: Text.ElideRight
                }
            }

            Image {
                id: viewsIcon
                source: "assets/usersViews.png"
                anchors{
                    bottom: parent.bottom
                    bottomMargin: 5
                    left: parent.left
                    leftMargin: 10
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                }
            }

            Rectangle {
                id: viewsRect
                width: views.width
                height: 20
                color: "transparent"
                clip: true
                anchors {
                    left: viewsIcon.right
                    leftMargin: 5
                    verticalCenter: viewsIcon.verticalCenter
                }

                Text {
                    id: views
                    text: qsTr("202,456 views")
                    anchors{
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }
                    font.pixelSize: 12
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                }
            }

            Image {
                id: commentsIcon
                source: "assets/comments.png"
                anchors{
                    bottom: viewsIcon.bottom
                    left: viewsRect.right
                    leftMargin: 16
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                }
            }

            Rectangle {
                id: commentsRect
                width: comments.width
                height: 20
                color: "transparent"
                clip: true
                anchors {
                    left: commentsIcon.right
                    leftMargin: 5
                    verticalCenter: commentsIcon.verticalCenter
                }

                Text {
                    id: comments
                    text: qsTr("1,234 comments")
                    anchors{
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }
                    font.pixelSize: 12
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                }
            }
        }
    }

    CustomDropshadow {
        source: buttonTemplate
        visible: true
        anchors.fill: source
    }
}
