import QtQuick
import QtQuick.Controls

Rectangle{
    id: recentLessonsDelegate
    width: 300
    height: 150
    color: "#D0C4D2"
    radius: 8
    clip: true

    property string category: "Category"
    property string lessonTitle: "LessonTitle"
    property string studentsNo: "7,643"
    property string rating: "4.5"
    property var instruction1: null

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
            text: rating
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

    MouseArea{
        id: lessonTemplateMA
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            if(instruction1){
                instruction1()
            }
        }
    }
}









