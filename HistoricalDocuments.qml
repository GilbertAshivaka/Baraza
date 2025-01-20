import QtQuick

Rectangle {
    id: contentFlowPage
    color: "#EBEBEC" //"#DADFE0"
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

        HistoricalDocsTemplate{
            tileWidth: parent.width/3 -20
            tileHeight: 150
            titleText: "Kenya's current constitution"
            userImageSource: "assets/constitution.jpg"
        }

        HistoricalDocsTemplate{
            tileWidth: parent.width/3 -20
            tileHeight: 150
            titleText: "Kenya's previous constitution"
            userImageSource: "assets/constitution1.png"
        }

        HistoricalDocsTemplate{
            tileWidth: parent.width/3 -20
            tileHeight: 150
            titleText: "Archived Bills"
            userImageSource: "assets/archivedBills.jpeg"
        }

        HistoricalDocsTemplate{
            tileWidth: parent.width/3 -20
            tileHeight: 150
            titleText: "Most Impactful Bills in Kenya"
            userImageSource: "assets/impactfulBills.jpeg"
        }
    }

}








