import QtQuick
import "DynamicComponentLoader.js" as CustomComponentLoader
Rectangle {
    id: learningPageFlow
    anchors.fill: parent
    color: "#F5F5F5"

    property real calculatedHeight: 0
    property real flowItemHeight: flowItem.calculateFlowHeight()
    property var learningContentPage: null

//    signal closeClicked()

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
        id: learningSearchBox
        width: parent.width* .65
        height: 50
        radius: 25
        color: "#BFBDBD" //"#D2CBCB"
        border.color: "white"
        anchors{
            top: parent.top
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
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
            text: "Search for lessons"
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
                focus: true
                anchors{
                    right: parent.right
                    rightMargin: 5
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
//                    leftMargin:
                }

                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 11
                onTextChanged: {
                    flowItem.updateVisibility(navigationTextInput.text)
                }
            }
        }
    }

    Image{
        id: filtersIcon
        width: 20
        height: 20
        anchors{
            left: learningSearchBox.right
            leftMargin: 32
            verticalCenter: learningSearchBox.verticalCenter
        }
        source: "assets/filters.png"
        fillMode: Image.PreserveAspectFit

        MouseArea{
            id: filtersIconMA
            anchors.fill: parent
            cursorShape: "PointingHandCursor"
        }
    }

    Rectangle{
        id: categoryRect1
        width: Math.max(160*(parent.width/1263), categoryText.width +20)
        height: 40
        color: "white"
        border.color: "lightgray"
        radius: 16
        anchors{
          horizontalCenter: learningSearchBox.horizontalCenter
          top: learningSearchBox.bottom
          topMargin: 10
        }

        Text{
            id: categoryText
            anchors.centerIn: parent
            text: "Public Finance and budgeting"
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Normal
            elide: Text.ElideRight
            maximumLineCount: 1
        }
    }

    Rectangle{
        id: categoryRect2
        width: Math.max(160*(parent.width/1263), categoryText2.width +20)
        height: 40
        color: "white"
        border.color: "lightgray"
        radius: 16
        anchors{
          top: categoryRect1.top
          left: categoryRect1.right
          leftMargin: 10
        }

        Text{
            id: categoryText2
            anchors.centerIn: parent
            text: "Constitution"
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Normal
            elide: Text.ElideRight
            maximumLineCount: 1
        }
    }

    Rectangle{
        id: categoryRect3
        width: Math.max(160*(parent.width/1263), categoryText3.width +20)
        height: 40
        color: "white"
        border.color: "lightgray"
        radius: 16
        anchors{
          top: categoryRect1.top
          right: categoryRect1.left
          rightMargin: 10
        }

        Text{
            id: categoryText3
            anchors.centerIn: parent
            text: "Justice system"
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Normal
            elide: Text.ElideRight
            maximumLineCount: 1
        }
    }

    Rectangle{
        id: categoryRect4
        width: Math.max(160*(parent.width/1263), categoryText4.width +20)
        height: 40
        color: "white"
        border.color: "lightgray"
        radius: 16
        anchors{
          top: categoryRect1.top
          right: categoryRect3.left
          rightMargin: 10
        }

        Text{
            id: categoryText4
            anchors.centerIn: parent
            text: "Education"
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Normal
            elide: Text.ElideRight
            maximumLineCount: 1
        }
    }

    Rectangle{
        id: categoryRect5
        width: Math.max(160*(parent.width/1263), categoryText5.width +20)
        height: 40
        color: "white"
        border.color: "lightgray"
        radius: 16
        anchors{
          top: categoryRect1.top
          left: categoryRect2.right
          leftMargin: 10
        }

        Text{
            id: categoryText5
            anchors.centerIn: parent
            text: "More..."
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Normal
            elide: Text.ElideRight
            maximumLineCount: 1
        }
    }

    Flow {
        id: flowItem
        width: parent.width* .75
        anchors {
            top: categoryRect1.bottom
            topMargin: 20
            left: parent.left
            leftMargin: 10
            rightMargin: 10
            right: parent.right
        }
        spacing: 20

        function updateVisibility(query) {
            for (let i = 0; i < children.length; i++) {
                let item = children[i];
                if (item.lessonTitle) {
                    item.visible = item.category.toLowerCase().indexOf(query.toLowerCase()) !== -1 ||
                        item.lessonTitle.toLowerCase().indexOf(query.toLowerCase()) !== -1;
                }
            }
            calculateFlowHeight();
        }

        function calculateFlowHeight() {
            let currentWidth = 0;
            let rowHeight = 0;
            let totalHeight = 0;
            let spacing = flowItem.spacing;

            for (let i = 0; i < children.length; i++) {
                let item = children[i];
                if (!item.visible) continue;

                if (currentWidth + item.width > flowItem.width) {
                    totalHeight += rowHeight + spacing;
                    currentWidth = 0;
                    rowHeight = 0;
                }

                currentWidth += item.width + spacing;
                rowHeight = Math.max(rowHeight, item.height);
            }

            totalHeight += rowHeight; // Add the last row's height
            calculatedHeight = totalHeight;
//            console.log("Calculated Height: ", totalHeight);
            return totalHeight;
        }

        onChildrenChanged: calculateFlowHeight()
        Component.onCompleted: calculateFlowHeight()

        Text {
            id: mostPopularText
            text: qsTr("Most popular")
            font.pointSize: 12
            width: parent.width *.7
            color: "#878585"
        }

        LessonTemplate {
            width: parent.width / 2 - 20
            category: "Public Finance and Budgeting"
            lessonTitle: "Understanding National Budgets and Public Spending"
            rating: "4.7"
            studentsNo: "6,834"
            instruction1: function(){
                CustomComponentLoader.customCreateComponent(learningContentPage, "LearningContentPage", homePageContainer)
            }
        }

        LessonTemplate {
            width: parent.width / 2 - 20
            category: "Constitution and Justice System"
            lessonTitle: "Understanding Constitutional Rights"
            rating: "4.8"
            studentsNo: "9,203"
            instruction1: function(){
                CustomComponentLoader.customCreateComponent(learningContentPage, "LearningContentPage", homePageContainer)
            }
        }

        LessonTemplate {
            width: parent.width / 2 - 20
            category: "Civic Participation"
            lessonTitle: "How to Engage in Public Decision-Making"
            rating: "4.6"
            studentsNo: "7,521"
        }

        LessonTemplate {
            width: parent.width / 2 - 20
            category: "Democracy and Elections"
            lessonTitle: "The Importance of Voting in a Democracy"
            rating: "4.9"
            studentsNo: "12,045"
        }

        Text {
            id: featuredLessonsText
            text: qsTr("Featured lessons")
            font.pointSize: 12
            width: parent.width * 0.7
            color: "#878585"
        }

        LessonTemplate {
            width: parent.width / 2 - 20
            category: "Environmental Policy"
            lessonTitle: "Sustainable Development and Climate Action"
            rating: "4.5"
            studentsNo: "5,672"
        }

        LessonTemplate {
            width: parent.width / 2 - 20
            category: "Public Health"
            lessonTitle: "The Role of Public Health in Civic Life"
            rating: "4.4"
            studentsNo: "4,980"
        }

        LessonTemplate {
            width: parent.width / 2 - 20
            category: "Law and Order"
            lessonTitle: "Criminal Justice and Law Enforcement"
            rating: "4.6"
            studentsNo: "7,312"
        }

        LessonTemplate {
            width: parent.width / 2 - 20
            category: "Education Policy"
            lessonTitle: "How Education Affects National Growth"
            rating: "4.8"
            studentsNo: "8,742"
        }
    }
}









