import QtQuick
import QtQuick.Controls.Fusion

Rectangle {
    id: polls
    anchors.fill: parent
    color: "#FBFBFB"
    clip: true

    MouseArea{
        id: pollsMA
        anchors.fill: parent
    }

    Rectangle{
        id: filterBtn
        width: 100
        height: 32
        radius: 25
        border.color: "#878585"
        border.width: 1
        clip: true
        anchors{
            top: parent.top
            topMargin: 10
            left: parent.left
            leftMargin: 20
        }

        Text{
            id: filterBtnTxt
            anchors.centerIn: parent
            text: "Active"
            font.pixelSize: 16
            //            font.bold: true
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
                text: "Active"
                onTriggered: {
                    filterBtnTxt.text = "Active"
                    categoryMenu.close()
                }
            }
            MenuItem{
                text: "Expired"
                onTriggered: {
                    filterBtnTxt.text = "Expired"
                    categoryMenu.close()
                }
            }
        }
    }

    Rectangle{
        id: createBtn
        width: 100
        height: 32
        radius: 25
        color: "#399ED9"
        border.color: "#399ED9"
        border.width: 2
        clip: true
        anchors{
            verticalCenter: filterBtn.verticalCenter
            right: parent.right
            rightMargin: 30
        }

        Text{
            id: createBtnTxt
            anchors.centerIn: parent
            text: "Create a poll"
            color: "white"
            font.pixelSize: 16
        }

        MouseArea{
            id: createBtnMA
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onEntered: {
                createBtn.color = "#397CE8"
            }
            onExited: {
                createBtn.color = "#399ED9"
            }

            onClicked:{

            }
        }
    }

    ListModel {
        id: optionsModel
        ListElement { pollId: 0; optionText: "Strongly Support"; votes: 40; percentage: 0 }
        ListElement { pollId: 0; optionText: "Support"; votes: 30; percentage: 0 }
        ListElement { pollId: 0; optionText: "Neutral"; votes: 10; percentage: 0 }
        ListElement { pollId: 0; optionText: "Oppose"; votes: 15; percentage: 0 }
        ListElement { pollId: 0; optionText: "Strongly Oppose"; votes: 5; percentage: 0 }
    }

    ListView{
        id: pollsLV
        width: parent.width
        clip: true
        spacing: 10
        anchors{
            top: filterBtn.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
        }

        model: ListModel{
            id: pollsModel
            ListElement {
                posterName: "Mathew Doe"
                pollTitle: "Should Kenya Increase Investment in Renewable Energy?"
                pollQuestion: "Do you support the government increasing investment in renewable energy sources like solar, wind, and geothermal power to boost Kenya's energy sustainability? This investment aims to reduce our reliance on fossil fuels, support environmental protection, and create new job opportunities. Considering these potential benefits, do you think it’s a good idea for Kenya to prioritize renewable energy?"
                datePosted: "2024-09-15"
                totalVotes: 1365
                optionStartIndex: 0
                optionsCount: 5
            }
            ListElement {
                posterName: "Jane Mwari"
                pollTitle: "Should Kenya Implement a Universal Basic Income Program?"
                pollQuestion: "Do you support the implementation of a Universal Basic Income (UBI) program in Kenya, where every adult citizen would receive a regular, unconditional payment from the government to help reduce poverty and income inequality? Consider its potential impact on welfare, employment, and overall economic growth before making your decision."
                datePosted: "2024-09-16"
                totalVotes: 1065
                optionStartIndex: 0
                optionsCount: 5
            }
        }

        delegate: Rectangle{
            id: pollsTile
            width: parent.width* .98
            height: 300
            radius: 8
            color: "white"
            border.color: "lightgray"
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle{
                id: posterNameRect
                width: Math.max(100, posterNameText.width + 12)
                height: 20
                radius: 25
                color: "#AAABAD"
                anchors{
                    left: parent.left
                    leftMargin: 10
                    top: parent.top
                    topMargin: 10
                }

                Text {
                    id: posterNameText
                    text: posterName
                    anchors.centerIn: parent
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                }
            }

            Text {
                id: pollTitleText
                text: pollTitle
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter
                width: parent.width
                anchors{
                    top: posterNameRect.bottom
                    topMargin: 10
                    left: parent.left
                    leftMargin: 8
                    right: parent.right
                    rightMargin: 10
                }
                font.bold: true
                wrapMode: Text.WordWrap
                elide: Text.ElideRight
                maximumLineCount: 2
            }

            Text {
                id: pollQuestionText
                text: pollQuestion
                font.pixelSize: 14
                verticalAlignment: Text.AlignVCenter
                width: parent.width
                anchors{
                    top: pollTitleText.bottom
                    topMargin: 10
                    left: parent.left
                    leftMargin: 8
                    right: parent.right
                    rightMargin: 10
                }
                wrapMode: Text.WordWrap
            }


            Rectangle{
                id: rect1
                width: parent.width* .5
                height: 24
                color: "#D4DBE5"
                border.color: "gray"
                border.width: 1
                radius: 25
                anchors{
                    top: pollQuestionText.bottom
                    topMargin: 16
                    left: pollQuestionText.left
                }
                clip: true

                Text {
                    id: option1
                    text: qsTr("I strongly support")
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    anchors{
                        left: parent.left
                        leftMargin: 8
                        verticalCenter: parent.verticalCenter
                    }
                }
                MouseArea{
                    id: option1MA
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    hoverEnabled: true
                    onClicked: {
                        incrementVote(pollId, index)
                    }
                }
            }

            Text {
                id: option1Percentage
                text: qsTr("51%")
                font.pixelSize: 14
                verticalAlignment: Text.AlignVCenter
                anchors{
                    left: rect1.right
                    leftMargin: 10
                    verticalCenter: rect1.verticalCenter
                }
            }

            Rectangle{
                id: rect2
                width: parent.width* .32
                height: 24
                color: "#D4DBE5"
                border.color: "gray"
                border.width: 1
                radius: 25
                anchors{
                    left: pollQuestionText.left
                    top: rect1.bottom
                    topMargin: 8
                }
                clip: true

                Text {
                    id: option2
                    text: qsTr("Invest more in the economy")
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    anchors{
                        left: parent.left
                        leftMargin: 8
                        verticalCenter: parent.verticalCenter
                    }
                }
                MouseArea{
                    id: option2MA
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    hoverEnabled: true
                    onClicked: {
                        incrementVote(pollId, index)
                    }
                }
            }

            Text {
                id: option2Percentage
                text: qsTr("32%")
                font.pixelSize: 14
                verticalAlignment: Text.AlignVCenter
                anchors{
                    left: rect2.right
                    leftMargin: 10
                    verticalCenter: rect2.verticalCenter
                }
            }

            Rectangle{
                id: rect3
                width: parent.width* .16
                height: 24
                color: "#D4DBE5"
                border.color: "gray"
                border.width: 1
                radius: 25
                anchors{
                    left: pollQuestionText.left
                    top: rect2.bottom
                    topMargin: 8
                }
                clip: true

                Text {
                    id: option3
                    text: qsTr("It is not a good move")
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    anchors{
                        left: parent.left
                        leftMargin: 8
                        verticalCenter: parent.verticalCenter
                    }
                }
                MouseArea{
                    id: option3MA
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    hoverEnabled: true
                    onClicked: {
                        incrementVote(pollId, index)
                    }
                }
            }

            Text {
                id: option3Percentage
                text: qsTr("17%")
                font.pixelSize: 14
                verticalAlignment: Text.AlignVCenter
                anchors{
                    left: rect3.right
                    leftMargin: 10
                    verticalCenter: rect3.verticalCenter
                }
            }

            Text {
                id: totalVotesText
                text: qsTr("Total votes: " + totalVotes)
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
//                width: parent.width
                anchors{
                    right: parent.right
                    rightMargin: 20
                    bottom: parent.bottom
                    bottomMargin: 10
                }
                color: "gray"
            }

            Text {
                id: datePostedText
                text: qsTr("Date posted: " + datePosted)
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
//                width: parent.width
                anchors{
                    right: totalVotesText.left
                    rightMargin: 10
                    bottom: parent.bottom
                    bottomMargin: 10
                }
                color: "gray"
            }
        }

    }


    function incrementVote(pollId, optionIndex) {
        var optionIndexInModel = findOptionIndex(pollId, optionIndex);
        if (optionIndexInModel === -1) return;

        var option = optionsModel.get(optionIndexInModel);
        var poll = getPollById(pollId);

        option.votes += 1;
        poll.totalVotes += 1;

        optionsModel.set(optionIndexInModel, option);

        recalculatePercentages(pollId);
    }

    function recalculatePercentages(pollId) {
        var poll = getPollById(pollId);
        var totalVotes = poll.totalVotes;

        for (var i = 0; i < optionsModel.count; i++) {
            var option = optionsModel.get(i);
            if (option.pollId === pollId) {
                if (totalVotes > 0) {
                    option.percentage = (option.votes / totalVotes) * 100;
                } else {
                    option.percentage = 0;
                }
                optionsModel.set(i, option);
            }
        }
    }

    function getPollById(pollId) {
        for (var i = 0; i < pollsModel.count; i++) {
            var poll = pollsModel.get(i);
            if (poll.id === pollId) {
                return poll;
            }
        }
        return null;
    }

    function findOptionIndex(pollId, optionIndex) {
        for (var i = 0; i < optionsModel.count; i++) {
            var option = optionsModel.get(i);
            if (option.pollId === pollId && option.optionIndex === optionIndex) {
                return i;
            }
        }
        return -1;
    }

}











