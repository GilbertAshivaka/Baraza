import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Dialogs

Rectangle {
    id: forumsPage1Flow
    anchors.fill: parent
    color: "#c0bebe"
    property real calculatedHeight: 0
    property real flowItemHeight: flowItem.calculateFlowHeight()

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
        id: forumSearchBox
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
            text: "Search for discussions"
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
            left: forumSearchBox.right
            leftMargin: 32
            verticalCenter: forumSearchBox.verticalCenter
        }
        source: "assets/filters.png"
        fillMode: Image.PreserveAspectFit

        MouseArea{
            id: filtersIconMA
            anchors.fill: parent
            cursorShape: "PointingHandCursor"
        }
    }

    Image{
        id: settingsIcon
        width: 20
        height: 20
        anchors{
            left: filtersIcon.right
            leftMargin: 10
            verticalCenter: filtersIcon.verticalCenter
        }
        source: "assets/settings.png"
        fillMode: Image.PreserveAspectFit

        MouseArea{
            id: settingsIconMA
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
          horizontalCenter: forumSearchBox.horizontalCenter
          top: forumSearchBox.bottom
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
                if (item.descriptionText) {
                    item.visible = item.descriptionText.toLowerCase().indexOf(query.toLowerCase()) !== -1 ||
                        item.titleText.toLowerCase().indexOf(query.toLowerCase()) !== -1;
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

        BigTileTemplate{
            id: button1
            tileWidth: parent.width * 0.5 - 20
            tileHeight: 300
            titleText: "The Impact of Rising Cost of Living in Kenya"
            descriptionText: "Kenyans continue to face an increased cost of living as prices of basic goods and services, such as food, fuel, and housing, rise significantly. This discussion focuses on the root causes, including inflation, government taxation, and global economic factors, and explores potential solutions to alleviate this burden on households."
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        BigTileTemplate{
            id: button2
            tileWidth: parent.width * 0.25 - 20
            tileHeight: 300
            titleText: "Youth Unemployment – Challenges and Solutions"
            descriptionText: "With over 60% of the population under the age of 35, youth unemployment remains one of Kenya's greatest challenges. This discussion addresses the factors contributing to high unemployment rates, such as limited access to education and skills, and evaluates various government and private sector initiatives aimed at solving the crisis."
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        BigTileTemplate{
            id: button3
            tileWidth: parent.width * 0.25 - 20
            tileHeight: 300
            titleText: "Fighting Corruption in Kenya's Public Institutions"
            descriptionText: "Despite numerous anti-corruption campaigns, corruption remains endemic in many public institutions. This discussion examines recent high-profile corruption scandals, the effectiveness of current anti-corruption efforts, and what reforms are needed to restore public trust."
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        BigTileTemplate{
            id: button4
            tileWidth: parent.width * 0.25 - 20
            tileHeight: 300
            titleText: "Healthcare Access and Quality"
            descriptionText: "Many Kenyans continue to face challenges in accessing quality healthcare services, especially in rural areas. This discussion delves into the state of healthcare infrastructure, the shortage of healthcare workers, and the high cost of treatment, while exploring policies to improve the sector."
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        BigTileTemplate{
            id: button5
            tileWidth: parent.width * 0.25 - 20
            tileHeight: 300
            titleText: "The Effects of Climate Change on Kenya’s Food Security"
            descriptionText: "Kenya's agricultural sector is feeling the impact of climate change, with unpredictable rainfall patterns and prolonged droughts affecting crop yields. This discussion focuses on how climate change is threatening food security and what adaptive strategies can be employed to ensure sustainable farming practices."
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        BigTileTemplate{
            id: button6
            tileWidth: parent.width * 0.25 - 20
            tileHeight: 300
            titleText: "Land Ownership Disputes and Forced Evictions"
            descriptionText: "Land ownership remains a contentious issue in Kenya, with many facing forceful evictions and land disputes. This discussion sheds light on historical land injustices, the ongoing legal battles over land rights, and the potential reforms required to address these challenges."
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        BigTileTemplate{
            id: button7
            tileWidth: parent.width * 0.25 - 20
            tileHeight: 300
            titleText: "Bridging Kenya's Digital Divide – Access to Internet and Technology"
            descriptionText: "With the world increasingly relying on digital technology, many rural areas in Kenya are still without reliable internet access. This discussion covers the barriers to achieving universal internet access, such as infrastructure and affordability, and the role of the government and private sector in bridging the digital divide."
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        BigTileTemplate{
            id: button8
            tileWidth: parent.width * 0.25 - 20
            tileHeight: 300
            titleText: "The Struggle for Gender Equality in Workplaces"
            descriptionText: "Despite advancements in gender equality, women in Kenya still face discrimination in the workplace, including wage gaps and limited leadership opportunities. This discussion highlights the current state of gender equality and what steps need to be taken to create more inclusive work environments."
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        BigTileTemplate{
            id: button9
            tileWidth: parent.width * 0.25 - 20
            tileHeight: 300
            titleText: "Breaking the Silence on Mental Health"
            descriptionText: "Mental health is often overlooked in Kenya, with limited resources dedicated to addressing the issue. This discussion seeks to raise awareness on mental health challenges, stigma, and the lack of adequate support systems, while promoting policies to improve mental health services across the country."
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }

        BigTileTemplate{
            id: button10
            tileWidth: parent.width * 0.5 - 20
            tileHeight: 300
            titleText: "Kenya’s Public Transportation System – Efficiency or Chaos?"
            descriptionText: "Kenya's public transportation system is vital but often criticized for inefficiency, safety concerns, and poor infrastructure. This discussion looks at the state of public transport, particularly in urban centers like Nairobi, and considers strategies for modernizing and expanding the network."
            userImageSource: backgroundImages[Math.floor(Math.random() * backgroundImages.length)]
        }
    }

}












