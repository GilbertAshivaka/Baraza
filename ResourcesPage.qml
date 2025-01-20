import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Dialogs


Rectangle {
    id: resourcesPage
    color: "#F5F5F5" //"#D2CBCB"
    anchors.fill: parent
    clip: true

    signal closeClicked()

    property var backgroundImages: [
        "assets/background1.jpg",
        "assets/background3.jpg",
        "assets/background4.jpg",
        "assets/background5.jpg",
        "assets/background6.jpg",
        "assets/background7.jpg",
        "assets/background8.jpg"
    ]


    MouseArea{
        id: resourcesPageMA
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
            verticalCenter: resourcesSearchBox.verticalCenter
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
                resourcesPage.closeClicked()
                homeBtn.defaultColor = "#75bcb5b5"
                resourcesBtn.defaultColor = "transparent"
            }
        }
    }



    Rectangle{
        id: resourcesSearchBox
        width: parent.width* .65
        height: 50
        radius: 25
        color: "#BFBDBD" //"#D2CBCB"
        border.color: "white"
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 10
        }

        Image {
            id: searchIcon

            anchors{
                left: parent.left
                leftMargin: 15
                verticalCenter: parent.verticalCenter
            }

            height: parent.height *.45
            fillMode: Image.PreserveAspectFit

            source: "assets/searchIcon.png"
        }

        Text{
            id: searchBoxPlaceHolder
            visible: navigationTextInput.text === ""
            color: "#585757"
            text: "Search for resources"
            anchors{
                left: searchIcon.right
                verticalCenter: parent.verticalCenter
                leftMargin: 22 //Adding 2 beacause the textInput below shifts 2px so that the blinking cursor can be seen
            }
        }

        MouseArea{
            id: toolBarSearchBoxMA
            cursorShape: "IBeamCursor"
            anchors{
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                left: searchIcon.right
                leftMargin: 20
            }

            TextInput{
                id: navigationTextInput
                clip: true
                focus: true
                anchors{
                    right: parent.right
                    rightMargin: 5
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                    leftMargin: 2
                }

                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 11
                onTextChanged: {

                }
            }
        }
    }

    Text {
        id: welcomeMsg
        text: qsTr("Baraza Resources")
        anchors{
            left: parent.left
            leftMargin: 10
            top: resourcesSearchBox.bottom
            topMargin: 20
        }
        color: "#897575"
        font.pointSize: 24
        elide: Text.ElideRight
        maximumLineCount: 1
    }

    ScrollView{
        id: mainScrollView
        width: parent.width
        contentHeight: 1000
        anchors{
            left: parent.left
            right: parent.right
            top: welcomeMsg.bottom
            topMargin: 10
            bottom: parent.bottom
        }

        Text {
            id: platformGuide
            text: qsTr("How to use the platform")
            color: "#897575"
            anchors{
                top: parent.top
                topMargin: 10
                left: parent.left
                leftMargin: 10
            }
            font.pointSize: 14
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            maximumLineCount: 1
        }

        VideoTileTemplate{
            id: video1Rect
            tileWidth: 350
            tileHeight: 200
            anchors{
                left: parent.left
                leftMargin: 10
                top: platformGuide.bottom
                topMargin: 10
            }
            titleText: "A guide on how to use the platform"
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        VideoTileTemplate{
            id: video2Rect
            tileWidth: 350
            tileHeight: 200
            anchors{
                left: video1Rect.right
                leftMargin: 20
                top: video1Rect.top
            }
            titleText: "Duties of a citizen in Civic Education"
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        Text {
            id: participationToolkit
            text: qsTr("Participation Toolkit")
            color: "#897575"
            anchors{
                left: parent.left
                leftMargin: 10
                top: video1Rect.bottom
                topMargin: 20
            }
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            elide: Text.ElideRight
            maximumLineCount: 1
        }

        ListView{
            id: participationToolkitLV
            width: parent.width
            height:  180//parent.height/3
            spacing: 8
            clip: true
            anchors{
                top: participationToolkit.bottom
                topMargin: 10
                left: participationToolkit.left
                right: parent.right
                rightMargin: 8
            }

            model: ListModel{
                ListElement{
                    categoryTitle: "Creating videos"
                    description: "A guide, template and example for creating videos for Baraza"
                }
                ListElement{
                    categoryTitle: "Writing articles"
                    description: "Find out how articles should be written"
                }
                ListElement{
                    categoryTitle: "Lessons"
                    description: "Template and guide for creating lessons"
                }
            }

            delegate: Rectangle{
                color: "#75bcb5b5"
                width: parent.width
                height: 44
                radius: 4
                clip: true

                Text {
                    id: categoryTitleText
                    height: 16
                    text: categoryTitle
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    anchors{
                        left: parent.left
                        leftMargin: 8
                        bottom: parent.verticalCenter
                    }
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    maximumLineCount: 1
                }

                Text {
                    id: descriptionText
                    height: 12
                    text: description
                    font.pointSize: 10
                    anchors{
                        top: categoryTitleText.bottom
                        topMargin: 2
                        left: categoryTitleText.left
                    }
                }
            }
        }

        Text {
            id: historicalDocs
            text: qsTr("Historical Documents")
            color: "#897575"
            anchors{
                left: parent.left
                leftMargin: 10
                top: participationToolkitLV.bottom
                topMargin: 20
            }
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            elide: Text.ElideRight
            maximumLineCount: 1

        }

        ScrollView{
            id: historicalDocsSV
            height: 300
            clip: true
            anchors{
                top: historicalDocs.bottom
                topMargin: 10
                left: parent.left
                right: parent.right
            }

            contentHeight: historicalDocuments.flowItemHeight +100

            HistoricalDocuments{
                id: historicalDocuments
                width: historicalDocsSV.width
            }
        }
    }
}
















