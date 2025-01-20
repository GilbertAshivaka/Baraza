import QtQuick
import QtQuick.Controls.Fusion

Rectangle {
    id: pollsSurveys
    color: "#FBFBFB"
    anchors.fill: parent
    clip: true

    signal closeClicked()

    MouseArea{
        id: pollsSurveysMA
        anchors.fill: parent
    }

    Rectangle {
        id: pollsSurveysTitleRect
        width: parent.width
        height: 50
        color: "#f5f5f5"
        anchors {
            top: parent.top
            left: parent.left
        }
        clip: true

        Image {
            id: pollsSurveysIcon
            source: "assets/polling.png"
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
            id: pollsSurveysTitle
            anchors {
                left: pollsSurveysIcon.right
                leftMargin: 10
                verticalCenter: parent.verticalCenter
            }

            text: "Polls and Surveys"
            font.pointSize: 12
            color: "#878585"
        }

        Rectangle{
            id: closeBtn
            width: 80
            height: 32
            radius: 25
//            color: "#878585"
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
//                color: "white"
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
                    pollsSurveys.closeClicked()
                    homeBtn.defaultColor = "#75bcb5b5"
                    pollsBtn.defaultColor = "transparent"
                }
            }
        }
    }

    Rectangle{
        id: displayPollsBtn
        height: 40
        width: displayPollsText.width + 12
        color: "transparent"
        anchors{
            left: parent.left
            leftMargin: 20
            top: pollsSurveysTitleRect.bottom
            topMargin: 10
        }

        Text {
            id: displayPollsText
            text: qsTr("Polls")
            font.pixelSize: 16
            anchors.centerIn: parent
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle{
            id: bottomRect1
            width: parent.width
            height: 2
            color: "#399ED9"
            anchors.bottom: parent.bottom
            visible: true
        }

        MouseArea{
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true

            onEntered:{
                displayPollsBtn.color = "#F5F5F5"
            }

            onExited: {
                displayPollsBtn.color = "transparent"
            }
            onClicked: {
                bottomRect2.visible = false
                bottomRect3.visible = false
                bottomRect1.visible = true
            }
        }
    }

    Rectangle{
        id: separator1
        width: 1
        height: displayPollsBtn.height* .7
        anchors{
            left: displayPollsBtn.right
            verticalCenter: displayPollsBtn.verticalCenter
        }
        color: "lightgray"
        visible: false
    }

    Rectangle{
        id: displaySurveysBtn
        height: 40
        width: displaySurveysText.width + 12
        color: "transparent"
        anchors{
            left: separator1.right
            top: pollsSurveysTitleRect.bottom
            topMargin: 10
        }

        Text {
            id: displaySurveysText
            text: qsTr("Surveys")
            font.pixelSize: 16
            anchors.centerIn: parent
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle{
            id: bottomRect2
            width: parent.width
            height: 2
            color: "#399ED9"
            anchors.bottom: parent.bottom
            visible: false
        }

        MouseArea{
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true

            onEntered:{
                displaySurveysBtn.color = "#F5F5F5"
            }

            onExited: {
                displaySurveysBtn.color = "transparent"
            }
            onClicked: {
                bottomRect1.visible = false
                bottomRect3.visible = false
                bottomRect2.visible = true
            }
        }
    }

    Rectangle{
        id: separator2
        width: 1
        height: displayPollsBtn.height* .7
        anchors{
            left: displaySurveysBtn.right
            verticalCenter: displaySurveysBtn.verticalCenter
        }
        color: "lightgray"
        visible: false
    }

    Rectangle{
        id: institutionSurveysBtn
        height: 40
        width: institutionSurveysText.width + 12
        color: "transparent"
        anchors{
            left: separator2.right
            top: pollsSurveysTitleRect.bottom
            topMargin: 10
        }

        Text {
            id: institutionSurveysText
            text: qsTr("Institution Surveys")
            font.pixelSize: 16
            anchors.centerIn: parent
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle{
            id: bottomRect3
            width: parent.width
            height: 2
            color: "#399ED9"
            anchors.bottom: parent.bottom
            visible: false
        }

        MouseArea{
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true

            onEntered:{
                institutionSurveysBtn.color = "#F5F5F5"
            }

            onExited: {
                institutionSurveysBtn.color = "transparent"
            }
            onClicked: {
                bottomRect1.visible = false
                bottomRect2.visible = false
                bottomRect3.visible = true
            }
        }
    }

    Loader{
        id: pollsSurveysLoader
        anchors{
            top: displayPollsBtn.bottom
            topMargin: 10
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        source: "Polls.qml"
    }
}
















