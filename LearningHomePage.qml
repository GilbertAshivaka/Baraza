import QtQuick
import QtQuick.Controls.Fusion
import QtCharts

Rectangle {
    id: learningHomepage
    color: "#f5f5f5"
    clip: true
    anchors.fill: parent

    signal closeClicked()

    MouseArea{
        id: learningHomepageMA
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
            verticalCenter: welcomeMsg.verticalCenter
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
                learningHomepage.closeClicked()
                learnBtn.defaultColor = "transparent"
                homeBtn.defaultColor = "#75bcb5b5"
            }
        }
    }

    Rectangle{
        id: rightPane
        width: parent.width* .25
        height: parent.height* .88
        radius: 8
        color: "#DBE0E7"
        anchors{
            right: parent.right
            rightMargin: 10
            verticalCenter: parent.verticalCenter
        }
        clip: true

        Image {
            id: notificationIcon
            source: "assets/bell.png"
            width: 24
            height: 24
            anchors{
                top: parent.top
                topMargin: 20
                left: parent.left
                leftMargin: 20
            }
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
            }
        }

        Image {
            id: settingsIcon
            source: "assets/settings.png"
            width: 24
            height: 24
            anchors{
                top: parent.top
                topMargin: 20
                right: parent.right
                rightMargin: 20
            }
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
            }
        }

        Text {
            id: progressText
            text: qsTr("Progress")
            font.pointSize: 14
            color: "#878585"
            anchors{
                top: notificationIcon.bottom
                topMargin: 20
                left: parent.left
                leftMargin: 10
            }
        }

        Text {
            id: progressPercentage
            text: qsTr("51%")
            font.pointSize: 14
            color: "#878585"
            anchors{
                left: progressText.right
                leftMargin: 20
                verticalCenter: progressText.verticalCenter
            }
        }

        Rectangle{
            id: progressRect
            width: parent.width* .90
            height: 4
            radius: 25
            color: "#FBFBFB"
            anchors{
                top: progressText.bottom
                topMargin: 10
                left: progressText.left
            }

            Rectangle{
                id: progressRectFill
                width: progressRect.width* .50
                height: progressRect.height
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
            id: statsRect
            width: parent.width* .95
            height: 300
            radius: 8
            color: "#EDEFF3"
            anchors{
                top: progressRect.bottom
                topMargin: 20
                horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: activity
                text: qsTr("Activity")
                font.pointSize: 10
                color: "#878585"
                anchors{
                    top: parent.top
                    topMargin: 10
                    left: parent.left
                    leftMargin: 10
                }
            }

            Rectangle{
                id: filterBtn
                width: 70
                height: 20
                radius: 25
                color: "#F5F5F5"
                border.color: "#878585"
                border.width: 1
                clip: true
                anchors{
                    top: parent.top
                    topMargin: 10
                    right: parent.right
                    rightMargin: 10
                }

                Text{
                    id: filterBtnTxt
                    anchors{
                        left: parent.left
                        leftMargin: 5
                        verticalCenter: parent.verticalCenter
                    }

                    text: "Year"
                    font.pointSize: 10
                }

                Image {
                    id: arrowDown
                    source: "assets/arrowDown.png"
                    width: 16
                    height: 16
                    anchors{
                        right: parent.right
                        rightMargin: 4
                        verticalCenter: parent.verticalCenter
                    }
                    fillMode: Image.PreserveAspectFit
                    visible: !categoryMenu.visible
                }

                MouseArea{
                    id: filterBtnMA
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onEntered: {
                        filterBtn.color = "#F5F5F5"
                    }
                    onExited: {
                        filterBtn.color = "#F5F5F5"
                    }

                    onClicked:{
                        categoryMenu.open()
                    }
                }

                Menu{
                    id: categoryMenu
                    width: 100
                    y: filterBtn.height

                    MenuItem{
                        text: "Year"
                        onTriggered: {
                            filterBtnTxt.text = "Year"
                            categoryMenu.close()
                        }
                    }
                    MenuItem{
                        text: "6 Months"
                        onTriggered: {
                            filterBtnTxt.text = "6 Months"
                            categoryMenu.close()
                        }
                    }
                    MenuItem{
                        text: "Month"
                        onTriggered: {
                            filterBtnTxt.text = "Month"
                            categoryMenu.close()
                        }
                    }
                }
            }

            Text {
                id: timeText
                text: qsTr("2.5h")
                font.pointSize: 14
                color: "#878585"
                anchors{
                    top: activity.bottom
                    topMargin: 10
                    left: parent.left
                    leftMargin: 10
                }
            }

            Rectangle{
                id: congratsTextRect
                width: Math.max(100, congratsText.width + 12)
                height: 20
                radius: 25
                color: "#DBE0E7"
                anchors{
                    left: timeText.right
                    leftMargin: 10
                    verticalCenter: timeText.verticalCenter
                }

                Text {
                    id: congratsText
                    text: "Good job. Congrats!"
                    anchors.centerIn: parent
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                }
            }

            Rectangle {
                id: graphRect
                width: parent.width * 0.95
                color: "transparent"
                anchors {
                    top: timeText.bottom
                    topMargin: 10
                    bottom: parent.bottom
                    bottomMargin: 8
                    horizontalCenter: parent.horizontalCenter
                }

                ChartView {
                    id: usageChart
                    anchors.fill: parent
                    title: "Learning over the past one year"
                    antialiasing: true

                    LineSeries {
                        name: "Avg. hours spent learning"
                        color: "red"
                        XYPoint { x: 0; y: 5.0 }    // January
                        XYPoint { x: 1; y: 7.5 }    // February
                        XYPoint { x: 2; y: 6.0 }    // March
                        XYPoint { x: 3; y: 8.5 }    // April
                        XYPoint { x: 4; y: 10.0 }   // May
                        XYPoint { x: 5; y: 9.0 }    // June
                        XYPoint { x: 6; y: 11.0 }   // July
                        XYPoint { x: 7; y: 12.5 }   // August
                        XYPoint { x: 8; y: 10.5 }   // September
                        XYPoint { x: 9; y: 8.0 }    // October
                        XYPoint { x: 10; y: 7.0 }   // November
                        XYPoint { x: 11; y: 6.5 }   // December
                    }
                }
            }
        }

        Text {
            id: recentLessons
            text: qsTr("Your recent lessons")
            font.pointSize: 12
            anchors{
                left: progressText.left
                top: statsRect.bottom
                topMargin: 10
            }
        }

        ListView{
            id: recentLessonsLV
            width: parent.width *.95
            spacing: 10
            clip: true
            anchors{
                top: recentLessons.bottom
                topMargin: 10
                bottom: parent.bottom
                bottomMargin: 4
                horizontalCenter: parent.horizontalCenter
            }

            model: ListModel{
                ListElement{
                    category: "Constitution and justice system"
                    rating: 4.8
                    lessonTitle: "Understanding constitutional rights"
                    studentsNo: "9,203"
                }
                ListElement {
                    category: "Democracy and Elections"
                    rating: 4.9
                    lessonTitle: "The Importance of Voting in a Democracy"
                    studentsNo: "12,045"
                }
            }

            delegate: Rectangle{
                id: recentLessonsDelegate
                width: parent.width
                height: 150
                color: "#D0C4D2"
                radius: 8
                clip: true
                Text {
                    id: recentLessonCategory
                    text: category
                    font.pointSize: 10
                    anchors{
                        left: parent.left
                        leftMargin: 10
                        right: ratingsRect.left
                        rightMargin: 10
                        top: parent.top
                        topMargin: 10
                    }
                    verticalAlignment: Text.AlignVCenter
                    elide: 	Text.ElideRight
                    maximumLineCount: 1
                }

                Rectangle{
                    id: ratingsRect
                    width: 60 //ratingsText.width + 12
                    height: 20
                    radius: 25
                    color: "#DBE0E7"
                    anchors{
                        right: parent.right
                        rightMargin: 10
                        top: parent.top
                        topMargin: 10
                    }

                    Image {
                        id: star
                        source: "assets/star.png"
                        width: height
                        height: parent.height* .7
                        anchors{
                            left: parent.left
                            leftMargin: 10
                            verticalCenter: ratingsRect.verticalCenter
                        }
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: ratingsText
                        text: model.rating
                        anchors{
                            left: star.right
                            leftMargin: 8
                            verticalCenter: parent.verticalCenter
                        }

                        font.pixelSize: 12
                        verticalAlignment: Text.AlignVCenter
                        color: "black"
                    }
                }

                Text {
                    id: lessonTitleText
                    text: lessonTitle
                    font.pointSize: 16
                    width: parent.width
                    anchors{
                        top: recentLessonCategory.bottom
                        topMargin: 10
                        left: recentLessonCategory.left
                        right: parent.right
                        rightMargin: 10
                    }
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                    maximumLineCount: 3
                }

                Text {
                    id: learnersNo
                    text: qsTr("Learners: " + studentsNo )
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
            }
        }
    }

    Text {
        id: welcomeMsg
        text: qsTr("Welcome to Baraza Learning, choose a lesson!")
        anchors{
            top: parent.top
            topMargin: 10
            left: backRect.right
            leftMargin: 10
            right: rightPane.left
            rightMargin: 20
        }
        font.pointSize: 24
        color: "#878585"
        elide: Text.ElideRight
        maximumLineCount: 1
    }

    ScrollView{
        id: learningSV
        anchors{
            top: welcomeMsg.bottom
            topMargin: 20
            left: parent.left
            right: rightPane.left
            rightMargin: 10
            bottom: parent.bottom
        }

        contentHeight: learningPageFlow.flowItemHeight + 150

        LearningPageFlow{
            id: learningPageFlow
            width: learningSV.width
        }
    }
}





















