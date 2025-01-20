import QtQuick

Rectangle {
    id: contentFlowPage
    color: "#DADFE0"
    property real calculatedHeight: 0
    property real flowItemHeight: flowItem.calculateFlowHeight()


    Flow {
        id: flowItem
        width: parent.width* .75
        anchors {
            top: parent.top
            left: parent.left
            leftMargin: 10
            rightMargin: 10
            right: parent.right
        }
        spacing: 20

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
            return totalHeight;
        }

        onChildrenChanged: calculateFlowHeight()
        Component.onCompleted: calculateFlowHeight()

        ContentTemplate {
            width: parent.width / 3 - 20
            category: "Lesson | Public Finance and Budgeting"
            contentTitle: "Understanding National Budgets and Public Spending"
            status: "In review"
            views: "6,834"
            instruction1: function(){

            }
        }

        ContentTemplate {
            width: parent.width / 3 - 20
            category: qsTr("Lesson | Public Finance and Budgeting")
            contentTitle: "Understanding National Budgets and Public Spending"
            status: "Posted: 18/09/2024"
            views: "6,834"
            instruction1: function(){

            }
        }

        ContentTemplate {
            width: parent.width / 3 - 20
            category: qsTr("Lesson | Public Finance and Budgeting")
            contentTitle: "Understanding National Budgets and Public Spending"
            status: "Posted: 18/09/2024"
            views: "6,834"
            instruction1: function(){

            }
        }

        ContentTemplate {
            width: parent.width / 3 - 20
            category: qsTr("Article | Democracy and Elections")
            contentTitle: "The Importance of Voting in a Democracy"
            status: "Posted: 18/09/2024"
            views: "6,834"
            instruction1: function(){

            }
        }

        ContentTemplate {
            width: parent.width / 3 - 20
            category: qsTr("Article | Education Policy")
            contentTitle: "How Education Affects National Growth"
            status: "Posted: 18/09/2024"
            views: "6,834"
            instruction1: function(){
                //does nothing for now
            }
        }
    }

}
