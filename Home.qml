import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Effects

Rectangle {
    id: home
    anchors.fill: parent
    color: "#D2CBCB"
    clip: true
    property string placeHolderText: "Explore"
    property string userImageSource: "assets/background1.jpg"
    property string userImageSource2: "assets/background1.jpg"

    property var backgroundImages: [
        "assets/background1.jpg",
        "assets/background3.jpg",
        "assets/background4.jpg",
        "assets/background5.jpg",
        "assets/background6.jpg",
        "assets/background7.jpg",
        "assets/background8.jpg"
    ]

    Rectangle{
        id: searchBox
        width: parent.width* .65
        height: 40
        radius: 4
        color: "#BFBDBD" //"#D2CBCB"
        border.color: "white"
        anchors{
            top: parent.top
            topMargin: 10
            horizontalCenter: rect1.horizontalCenter
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
            text: placeHolderText
            anchors{
                left: searchIcon.right
                verticalCenter: parent.verticalCenter
                leftMargin: 20
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
                anchors{
                    right: parent.right
                    rightMargin: 5
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                    //            leftMargin: 20
                }

                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 11
            }
        }
    }

    Rectangle {
        id: rect1
        height: 200
        width: parent.width* .90
        radius: 16
        clip: true
        border.color: "lightgray"
        border.width: 2
        anchors{
//            horizontalCenter: parent.horizontalCenter
            left: parent.left
            leftMargin: 20
            top: searchBox.bottom
            topMargin: 16
        }


        Image {
            id: sourceItem
            source: "assets/kenyanFlag" //userImageSource
            anchors.centerIn: parent
            width: parent.width //* 0.4688
            height: parent.height
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
                radius: 16
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
        Text {
            id: text18
            anchors{
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 20
            }

            text: qsTr("Empowering Citizens Through Education and Participation")
            font.pixelSize: 24
            verticalAlignment: Text.AlignVCenter
            color: "white"
        }

        Text {
            id: text19
            anchors{
                horizontalCenter: text18.horizontalCenter
                top: text18.bottom
                topMargin: 10
            }

            text: qsTr("Take your seat at the decision making table.........")
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Thin
            font.italic: true
            color: "white"
        }

        Text {
            id: text20
            width: parent.width
            text: qsTr("You can learn about and contribute to ongoing hot discussions regarding Kenyan laws in different fields on this platform.")
            anchors{
                left: parent.left
                leftMargin: 40
                right: parent.right
                rightMargin: 10
                top: text19.bottom
                topMargin: 32
            }
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Normal
            color: "white"
            font.italic: true
            wrapMode: Text.WordWrap
            elide: Text.ElideRight
            maximumLineCount: 2
        }

        Rectangle{
            id:copyrightRect
            color: "transparent"
            height: 32
            width: copyrightTxt.width
            anchors{
                right: parent.right
                rightMargin: 20
                bottom: parent.bottom
                bottomMargin: 10
            }

            Text {
                id: copyrightTxt
                text: "\u00A9 2024 Baraza"
                font.pixelSize: 12
                anchors{
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
                font.weight: Font.Thin
                verticalAlignment: Text.AlignVCenter
                color: "white"
                wrapMode: Text.WordWrap
                elide: Text.ElideRight
                maximumLineCount: 1
            }
        }

        Text {
            id: learnMoreBtn
            text: "Learn more"
            font.pixelSize: 14
            color: "white"
            font.weight: Font.Thin
            anchors{
                verticalCenter: copyrightRect.verticalCenter
                right: copyrightRect.left
                rightMargin: 10
            }

            Rectangle {
                id: underline1
                visible: true
                width: learnMoreBtn.width + 5  // some extra width for spacing
                height: 1
                color: "white"
                anchors.top: learnMoreBtn.bottom
                anchors.horizontalCenter: learnMoreBtn.horizontalCenter
                anchors.topMargin: 0  // spacing between text and underline
            }

            MouseArea{
                id: learnMoreBtnMA
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true

                onClicked: {

                }
                onPressed: {
                    learnMoreBtn.color = "lightgray"
                    underline1.color = "lightgray"
                }
                onReleased: {
                    learnMoreBtn.color = "white"
                    underline1.color = "white"
                }
            }
        }


    }

    ScrollView{
        id: homeSV
        width: parent.width
        anchors{
            top: rect1.bottom
            topMargin: 20
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        contentHeight: 600

        Text {
            id: currentDiscussions
            anchors{
                top: parent.top
                topMargin: 10
                left: parent.left
                leftMargin: 20
            }

            text: qsTr("Trending discussions and polls")
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Medium
        }

        ButtonTemplate{
            id: button1
            tileWidth: (parent.width/2)* .85 //406
            tileHeight: 206
            titleText: "The Kenya Robotics and Artificial Intelligence Society Bill, 2023"
            descriptionText: "The Kenya Robotics and Artificial Intelligence Society Bill, 2023, aims to establisha regulatory framework for the development and application of robotics and AI technologiesin Kenya. It proposes the creation of the Kenya Robotics and Artificial Intelligence Society to oversee these activities, ensuring ethical and responsible innovation. The bill outlines the roles of national and county governments in supporting this sector and includes penalties for non-compliance, such as fines and imprisonment. This legislation is designed to position Kenya as a leader in technological innovation while safeguarding societal interests and ethical standards."
            anchors{
                top: currentDiscussions.bottom
                topMargin: 10
                left: currentDiscussions.left
                right: tile1.right
            }
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        ButtonTemplate{
            id: button2
            tileWidth: (parent.width/2)* .85 //406
            tileHeight: 206
            titleText: "Product Security and Telecommunications Infrastructure Bill (PSTI)"
            descriptionText: "This bill focuses on enhancing cybersecurity for consumer tech products. It mandates manufacturers to meet stringent security standards, bans universal default passwords, and requires transparency about security updates. Non-compliance can result in hefty fines."
            anchors{
                top: button1.top
                left: button1.right
                leftMargin: 32
                right: tile2.right
            }
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        Text {
            id: allToolsBtn
            text: "See all..."
            font.pixelSize: 12
            color: "black"
            anchors{
                bottom: currentDiscussions.bottom
                right: button2.right
            }

            Rectangle {
                id: underline
                visible: true
                width: allToolsBtn.width + 5  // some extra width for spacing
                height: 1
                color: "black"
                anchors.top: allToolsBtn.bottom
                anchors.horizontalCenter: allToolsBtn.horizontalCenter
                anchors.topMargin: 0  // spacing between text and underline
            }

            MouseArea{
                id: allToolsBtnMA
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true

                onClicked: {

                }
                onPressed: {
                    allToolsBtn.color = "white"
                    underline.color = "white"
                }
                onReleased: {
                    allToolsBtn.color = "black"
                    underline.color = "black"
                }
            }
        }

        Text {
            id: learning
            anchors{
                left: currentDiscussions.left
                top: button1.bottom
                topMargin: 40
            }

            text: qsTr("Learning")
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Medium
        }

        Image {
            id: learnInfo
            source: "assets/learnInfo1.png"
            width: 20
            height: 20
            anchors{
                left: learning.right
                leftMargin: 5
                verticalCenter: learning.verticalCenter
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                hoverEnabled: true
                onEntered: {
                    learnInfo.source = "assets/learnInfo.png"
                }
                onExited: {
                    learnInfo.source = "assets/learnInfo1.png"
                }
            }
        }

        TileTemplate{
            id: tile1
            tileWidth: (parent.width/2)* .85
            tileHeight: 250
            category: "Legal System and Judiciary"
            titleText: "Constitutional Amendments and Reforms"
            descriptionText: "Learn about the processes involved in amending the Kenyan Constitution, including the roles of Parliament, the public, and referenda. Explore past and proposed constitutional reforms, and understand the implications of such changes on governance and public policy."
            anchors{
                top: learning.bottom
                topMargin: 10
                left: learning.left
            }
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }
        TileTemplate{
            id: tile2
            tileWidth: (parent.width/2)* .85
            tileHeight: 250
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
            anchors{
                left: tile1.right
                leftMargin: 32
                top: tile1.top
            }
            category: "Public Finance and Economic Governanance"
            titleText: "Public Finance and Budgeting"
            descriptionText: "Explore the principles of public finance management as outlined in the Constitution, including the processes of budgeting, revenue collection, and public expenditure. Learn about the roles of national and county governments in financial management and the importance of transparency and accountability."

        }
    }
}










