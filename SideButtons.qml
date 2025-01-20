import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Effects
import "DynamicComponentLoader.js" as ComponentLoader

Rectangle {
    id: sideButtons
    color: "#e2dada"

    property int btnWidth: width* .90
    property string userImageSource: "assets/_.png"
    property var myButtons: []
    property string activeButton: "homeBtn" //tracks which button is active

    property var allBills: null
    property var forumPage1: null
    property var pollsSurveys: null
    property var learningHomePage: null
    property var contributorsPage: null
    property var resourcesPage: null

    Component.onCompleted: {
        var myButtons = [
        homeBtn,
        dashBoardBtn,
        billsBtn,
        learnBtn,
        pollsBtn,
        resourcesBtn,
        forumsBtn,
        contributorsBtn
        ];

//        updateButtonColors("homeBtn");
    }

    function updateButtonColors(activeButtonId) {
        for (let i = 0; i < myButtons.length; i++) {
            if (myButtons[i] === activeButtonId) {
                myButtons[i].defaultColor = "#75bcb5b5"; // active button color
            } else {
                myButtons[i].defaultColor = "transparent"; // Inactive button color
            }
        }
    }

    Rectangle {
        id: userProfileRect
        height: 120
        width: height
        radius: width/2
        clip: true
        anchors{
            top: parent.top
            topMargin: 10
            left: parent.left
            leftMargin: 20
        }

        color: "transparent"

//                    property string imageSource: "qrc:Libro1/assets/userImage.png"

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
        id: userName
        anchors{
            top: userProfileRect.bottom
            topMargin: 5
            left: userProfileRect.left
        }

        text: qsTr("Gilbert Ashivaka")
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.Bold
    }

    Text {
        id: field
        anchors{
            top: userName.bottom
            topMargin: 3
            left: userName.left
        }

        text: qsTr("Science and Technology")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.Light
        font.italic: true
    }

    CustomButton{
        id: homeBtn
        text: "Home"
        width: parent.btnWidth
        defaultColor: "#75bcb5b5"
        buttonIcon: "assets/homeIcon.png"
        anchors{
            top: field.bottom
            topMargin: 20
            left: parent.left
            leftMargin: 10
        }

        onClicked: {
            dashBoardBtn.defaultColor = "transparent"
            billsBtn.defaultColor = "transparent"
            learnBtn.defaultColor = "transparent"
            pollsBtn.defaultColor = "transparent"
            resourcesBtn.defaultColor = "transparent"
            forumsBtn.defaultColor = "transparent"
            contributorsBtn.defaultColor = "transparent"
            homeBtn.defaultColor = "#75bcb5b5"
        }
    }

    CustomButton{
        id: dashBoardBtn
        text: "Dashboard"
        width: parent.btnWidth
        defaultColor: "transparent"
        buttonIcon: "assets/dashboard.png"
        anchors{
            top: homeBtn.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 10
        }
        onClicked: {
            homeBtn.defaultColor = "transparent"
            billsBtn.defaultColor = "transparent"
            learnBtn.defaultColor = "transparent"
            pollsBtn.defaultColor = "transparent"
            resourcesBtn.defaultColor = "transparent"
            forumsBtn.defaultColor = "transparent"
            contributorsBtn.defaultColor = "transparent"
            dashBoardBtn.defaultColor = "#75bcb5b5"
        }
    }

    CustomButton{
        id: billsBtn
        text: "Current Bills"
        width: parent.btnWidth
        defaultColor: "transparent"
        buttonIcon: "assets/bills.png"
        anchors{
            top: dashBoardBtn.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 10
        }
        onClicked: {
            homeBtn.defaultColor = "transparent"
            dashBoardBtn.defaultColor = "transparent"
            learnBtn.defaultColor = "transparent"
            pollsBtn.defaultColor = "transparent"
            resourcesBtn.defaultColor = "transparent"
            forumsBtn.defaultColor = "transparent"
            contributorsBtn.defaultColor = "transparent"
            billsBtn.defaultColor = "#75bcb5b5"
            ComponentLoader.customCreateComponent(allBills, "AllBills", mainContainer)
        }
    }

    CustomButton{
        id: learnBtn
        text: "Learning"
        width: parent.btnWidth
        buttonIcon: "assets/learning.png"
        anchors{
            top: billsBtn.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 10
        }
        onClicked: {
            homeBtn.defaultColor = "transparent"
            dashBoardBtn.defaultColor = "transparent"
            billsBtn.defaultColor = "transparent"
            pollsBtn.defaultColor = "transparent"
            resourcesBtn.defaultColor = "transparent"
            forumsBtn.defaultColor = "transparent"
            contributorsBtn.defaultColor = "transparent"
            learnBtn.defaultColor = "#75bcb5b5"
            ComponentLoader.customCreateComponent(learningHomePage, "LearningHomePage", homePageContainer)
        }
    }

    CustomButton{
        id: pollsBtn
        text: "Polls and surveys"
        width: parent.btnWidth
        buttonIcon: "assets/survey.png"
        anchors{
            top: learnBtn.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 10
        }
        onClicked: {
            homeBtn.defaultColor = "transparent"
            dashBoardBtn.defaultColor = "transparent"
            billsBtn.defaultColor = "transparent"
            learnBtn.defaultColor = "transparent"
            resourcesBtn.defaultColor = "transparent"
            forumsBtn.defaultColor = "transparent"
            contributorsBtn.defaultColor = "transparent"
            pollsBtn.defaultColor = "#75bcb5b5"

            ComponentLoader.customCreateComponent(pollsSurveys, "PollsSurveys", homePageContainer)
        }
    }

    CustomButton{
        id: resourcesBtn
        text: "Resources"
        width: parent.btnWidth
        defaultColor: "transparent"
        buttonIcon: "assets/resources.png"
        anchors{
            top: pollsBtn.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 10
        }
        onClicked: {
            homeBtn.defaultColor = "transparent"
            dashBoardBtn.defaultColor = "transparent"
            billsBtn.defaultColor = "transparent"
            learnBtn.defaultColor = "transparent"
            pollsBtn.defaultColor = "transparent"
            forumsBtn.defaultColor = "transparent"
            contributorsBtn.defaultColor = "transparent"
            resourcesBtn.defaultColor = "#75bcb5b5"
            ComponentLoader.customCreateComponent(resourcesPage, "ResourcesPage", homePageContainer)
        }
    }

    CustomButton{
        id: forumsBtn
        text: "Forums and discussions"
        width: parent.btnWidth
        buttonIcon: "assets/forum.png"
        anchors{
            top: resourcesBtn.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 10
        }
        onClicked: {
            homeBtn.defaultColor = "transparent"
            dashBoardBtn.defaultColor = "transparent"
            billsBtn.defaultColor = "transparent"
            learnBtn.defaultColor = "transparent"
            pollsBtn.defaultColor = "transparent"
            resourcesBtn.defaultColor = "transparent"
            contributorsBtn.defaultColor = "transparent"
            forumsBtn.defaultColor = "#75bcb5b5"
            ComponentLoader.customCreateComponent(forumPage1, "ForumPage1", mainContainer)
        }
    }

    CustomButton{
        id: contributorsBtn
        text: "Contributors panel"
        width: parent.btnWidth
        buttonIcon: "assets/contribution.png"
        anchors{
            top: forumsBtn.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 10
        }
        onClicked: {
            homeBtn.defaultColor = "transparent"
            dashBoardBtn.defaultColor = "transparent"
            billsBtn.defaultColor = "transparent"
            learnBtn.defaultColor = "transparent"
            pollsBtn.defaultColor = "transparent"
            resourcesBtn.defaultColor = "transparent"
            forumsBtn.defaultColor = "transparent"
            contributorsBtn.defaultColor = "#75bcb5b5"
            ComponentLoader.customCreateComponent(contributorsPage, "ContributorsPage", homePageContainer)
        }
    }

}














