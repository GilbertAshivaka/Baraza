import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Dialogs

Rectangle {
    id: contributorsPage
    anchors.fill: parent
    color: "#F5F5F5"
    clip: true

    signal closeClicked()

    MouseArea{
        id: contributorsPageMA
        anchors.fill: parent
    }

    Rectangle {
        id: contributorsTitleRect
        width: parent.width
        height: 50
        color: "#FBFBFB"
        anchors {
            top: parent.top
            left: parent.left
        }
        clip: true

        Image {
            id: contributorsIcon
            source: "assets/contribution.png"
            width: 32
            height: 32
            anchors{
                left: parent.left
                leftMargin: 20
                verticalCenter: parent.verticalCenter
            }
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: contributorsTitle
            anchors {
                left: contributorsIcon.right
                leftMargin: 10
                verticalCenter: parent.verticalCenter
            }

            text: "Contributor panel"
            font.pointSize: 12
            color: "#878585"
        }

        Rectangle{
            id: closeBtn
            width: 80
            height: 32
            radius: 25
            border.color: "#878585"
            border.width: 2
            clip: true
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 30
            }

            Text{
                id: closeBtnTxt
                anchors.centerIn: parent
                text: "Close"
                font.pixelSize: 16
                font.bold: true
            }

            MouseArea{
                id: closeBtnMA
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onEntered: {
                    closeBtn.color = "#878585"
                    closeBtnTxt.color = "white"
                }
                onExited: {
                    closeBtn.color = "white"
                    closeBtnTxt.color ="#878585"
                }

                onClicked:{
                    contributorsPage.closeClicked()
                    contributorsBtn.defaultColor = "transparent"
                    homeBtn.defaultColor = "#75bcb5b5"
                }
            }
        }
    }

    Item{
        id: contentItem
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: contributorsTitleRect.bottom
        }

        Rectangle{
            id: profileDetailsRect
            width: parent.width* .50
            height: 200
            color: "#EBEBEC"
            radius: 8
            anchors{
                left: parent.left
                leftMargin: 10
                top: parent.top
                topMargin: 10
            }

            Rectangle {
                id: userProfileRect
                height: 100
                width: height
                radius: width/2
                clip: true
                color: "transparent"
                anchors{
                    top: parent.top
                    topMargin: 10
                    left: parent.left
                    leftMargin: 10
                }

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

            Text {
                id: nameText
                text: qsTr("Gilbert Ashivaka")
                font.pointSize: 16
                anchors{
                    left: userProfileRect.right
                    leftMargin: 10
                    top: userProfileRect.top
                    topMargin: 5
                    right: parent.right
                }
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                maximumLineCount: 1
            }

            Rectangle{
                id: area3Rect
                width: Math.max(100, area3.width + 12)
                height: 20
                radius: 25
                color: "#F5F5F5"
                anchors{
                    top: nameText.bottom
                    topMargin: 3
                    left: nameText.left
                }

                Text {
                    id: area3
                    anchors{
                        left: parent.left
                        leftMargin: 5
                        verticalCenter: parent.verticalCenter
                    }

                    color: "#878585"
                    text: qsTr("Expert insight videos")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Normal
                    font.italic: true
                }
            }

            Rectangle{
                id: area1Rect
                width: Math.max(100, area2.width + 12)
                height: 20
                radius: 25
                color: "#F5F5F5"
                anchors{
                    top: area3Rect.bottom
                    topMargin: 3
                    left: nameText.left
                }

                Text {
                    id: area1
                    anchors{
                        left: parent.left
                        leftMargin: 5
                        verticalCenter: parent.verticalCenter
                    }
                    color: "#878585"
                    text: qsTr("Articles")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Normal
                    font.italic: true
                }
            }

            Rectangle{
                id: area2Rect
                width: Math.max(100, area2.width + 12)
                height: 20
                radius: 25
                color: "#F5F5F5"
                anchors{
                    top: area1Rect.bottom
                    topMargin: 3
                    left: nameText.left
                }

                Text {
                    id: area2
                    anchors{
                        left: parent.left
                        leftMargin: 5
                        verticalCenter: parent.verticalCenter
                    }
                    color: "#878585"
                    text: qsTr("Lessons")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Normal
                    font.italic: true
                }
            }

            Rectangle{
                id: editBtn
                width: buttonText.width + editButtonIcon.width + 16
                height: 40
                color: "#9AB4EC"
                radius: 4
                anchors{
                    left: nameText.left
                    top: area2Rect.bottom
                    topMargin: 8
                }

                Image {
                    id: editButtonIcon
                    source: "assets/edit.png"
                    width: height
                    height: parent.height* .70
                    fillMode: Image.PreserveAspectFit
                    anchors{
                        left: parent.left
                        leftMargin: 4
                        verticalCenter: parent.verticalCenter
                    }
                }

                Text {
                    id: buttonText
                    text: qsTr("Edit contribution areas")
                    anchors{
                        left: editButtonIcon.right
                        leftMargin: 5
                        verticalCenter: parent.verticalCenter
                    }
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    maximumLineCount: 1
                }
            }

            Rectangle{
                id: addBtn
                width: editBtn.width//addButtonText.width + addButtonIcon.width + 16
                height: 40
                color: "#9AB4EC"
                radius: 4
                anchors{
                    left: editBtn.right
                    leftMargin: 10
                    verticalCenter: editBtn.verticalCenter
                }

                Image {
                    id: addButtonIcon
                    source: "assets/plus.png"
                    width: height
                    height: parent.height* .5
                    fillMode: Image.PreserveAspectFit
                    anchors{
                        left: parent.left
                        leftMargin: 4
                        verticalCenter: parent.verticalCenter
                    }
                }


                Text {
                    id: addButtonText
                    text: qsTr("Add content")
                    anchors{
                        left: addButtonIcon.right
                        leftMargin: 5
                        verticalCenter: parent.verticalCenter
                    }
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    maximumLineCount: 1
                }
            }
        }

        Rectangle{
            id: leaderboardRect
            height: 200
            color: "#EBEBEC"
            radius: 8
            anchors{
                left: profileDetailsRect.right
                leftMargin: 30
                right: parent.right
                rightMargin: 10
                top: profileDetailsRect.top
            }

            Text {
                id: headerText
                text: qsTr("Learderboard: Top contributors this month")
                font.pointSize: 14
                color: "#878585"
                anchors{
                    left: parent.left
                    leftMargin: 10
                    top: parent.top
                    topMargin: 10
                }
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                maximumLineCount: 2
            }

            ListView{
                id: learderboardLV
                clip: true
                spacing: 8
                anchors{
                    top: headerText.bottom
                    topMargin: 10
                    left: parent.left
                    leftMargin: 10
                    right: parent.right
                    rightMargin: 8
                    bottom: parent.bottom
                }

                //make a model of 5 random people with these properties, name and number of contributions
                model: ListModel {
                    ListElement { name: "Lewis Omogi"; contributions: 122; total: 534 }
                    ListElement { name: "Billy Ouma"; contributions: 110; total: 423 }
                    ListElement { name: "John Doe"; contributions: 80; total: 345 }
                    ListElement { name: "Alice Doe"; contributions: 72; total: 321 }
                    ListElement { name: "Bob Doe"; contributions: 64; total: 271 }
                }

                delegate: Rectangle{
                    id: leaderboardDelegate
                    width: parent.width* .98
                    height: 44
                    color: "#75bcb5b5"
                    radius: 4
                    clip: true
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        id: userProfileRect2
                        height: parent.height* .70
                        width: height
                        radius: width/2
                        clip: true
                        color: "transparent"
                        anchors{
                            left: parent.left
                            leftMargin: 10
                            verticalCenter: parent.verticalCenter
                        }

                        Image {
                            id: sourceItem2
                            source: "assets/userImage.png"
                            anchors.centerIn: parent
                            width: parent.width //* 0.4688
                            height: width
                            visible: false
                            fillMode: Image.PreserveAspectCrop
                        }

                        MultiEffect {
                            source: sourceItem2
                            anchors.fill: sourceItem2
                            maskEnabled: true
                            maskSource: mask2
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
                                radius: width / 2
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
                                    sourceItem2.source = fileUrl
                                }
                            }
                            onRejected: {
                                console.log("Canceled")
                            }
                        }

                        MouseArea {
                            anchors.fill: sourceItem2
                            cursorShape: "PointingHandCursor"
                            onClicked: fileDialog2.open()
                            hoverEnabled: true
                        }
                    }

                    Text {
                        id: nameText2
                        text: name
                        font.pointSize: 12
                        anchors{
                            left: userProfileRect2.right
                            leftMargin: 10
                            top: parent.top
                            topMargin: 2
                        }
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        maximumLineCount: 1
                    }

                    Text {
                        id: totalContributionsText
                        text: "Total contributions: " + total
                        font.pointSize: 10
                        color: "#878585"
                        anchors{
                            left: nameText2.left
                            top: nameText2.bottom
                            topMargin: 2
                            right: parent.right
                        }
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        maximumLineCount: 1
                    }

                    Rectangle{
                        id: contributionsRect
                        width: Math.max(50, contributionsText.width + 12)
                        height: parent.height* .50
                        radius: 25
                        color: "#F5F5F5"
                        anchors{
                            right: parent.right
                            rightMargin: 10
                            verticalCenter: parent.verticalCenter
                        }

                        Text {
                            id: contributionsText
                            anchors.centerIn: parent
                            color: "#878585"
                            text: contributions
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.Bold
                        }
                    }
                }
            }
        }

        Rectangle{
            id: contentRect
            color: "#DADFE0"
            radius: 8
            anchors{
                top: profileDetailsRect.bottom
                topMargin: 20
                left: parent.left
                leftMargin: 10
                right: parent.right
                rightMargin: 10
                bottom: parent.bottom
                bottomMargin: 5
            }

            Text {
                id: contentHeader
                text: qsTr("Your content")
                font.pointSize: 14
                color: "#878585"
                width: parent.widthn
                anchors{
                    left: parent.left
                    leftMargin: 10
                    top: parent.top
                    topMargin: 10
                }
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                maximumLineCount: 1
            }

            ScrollView{
                id: contributorsSV
                anchors{
                    top: contentHeader.bottom
                    topMargin: 20
                    left: parent.left
                    right: parent.right
                    rightMargin: 10
                    bottom: parent.bottom
                }

                contentHeight: contentFlowPage.flowItemHeight + 150

                ContentFlowPage{
                    id: contentFlowPage
                    width: contributorsSV.width
                }
            }
        }
    }
}










