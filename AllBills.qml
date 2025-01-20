import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtWebEngine
import QtWebView
import QtWebChannel
import QtQuick.Dialogs

Rectangle {
    id: allBills
    anchors.fill: parent
    width: parent.width
    height: parent.height
    color: "#D2CBCB"

    signal closeClicked()
    property string placeHolderText: "Search in bills"
    property string userImage: "assets/_.png"
    property string  billBigTitle: ""
    property string currentUrl: "assets/AIBill2023.html"
    property var billArray: [
    "assets/AIBill2023.html",
    "assets/FinanceBill2025.html",
    "assets/DataProtectionBill.html",
    "assets/ClimateChangeBill.html",
    "assets/EmploymentBill.html"
    ]

    MouseArea{
        id: allBillsMA
        anchors.fill: parent
    }

    Rectangle{
        id: billsList
        width: parent.width* .25
        height: parent.height
        color: "#e2dada"
        anchors{
            left: parent.left
            top: parent.top
            bottom: parent.bottom
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
                top: parent.top
                topMargin: 10
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
                    allBills.closeClicked()
                    billsBtn.defaultColor = "transparent"
                    homeBtn.defaultColor = "#75bcb5b5"
                }
            }
        }

        Image{
            id: menuBarIcon
            width: 32
            height: 32
            source: "assets/menuBars.png"
            anchors{
                top: parent.top
                topMargin: 10
                left: backRect.right
                leftMargin: 10
            }
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text3
            width: 198
            height: 29
            anchors{
                left: menuBarIcon.right
                leftMargin: 20
                verticalCenter: menuBarIcon.verticalCenter
            }

            text: qsTr("All bills")
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.DemiBold
        }

        Rectangle{
            id: searchBox
            width: parent.width* .98
            height: 40
            radius: 4
            color: "#F5F3F3" //"#BFBDBD" //"#D2CBCB"
            border.color: "lightgray"
            anchors{
                top: menuBarIcon.bottom
                topMargin: 18
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

                source: "assets/search.png"
            }

            Text{
                id: searchBoxPlaceHolder
                visible: navigationTextInput.text === ""
                color: "black" //"#585757"
                text: placeHolderText
                anchors{
                    left: searchIcon.right
                    verticalCenter: parent.verticalCenter
                    leftMargin: 5
                }
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                font.italic: true
                font.weight: Font.Medium
            }

            MouseArea{
                id: toolBarSearchBoxMA
                cursorShape: "IBeamCursor"
                anchors{
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                    left: searchIcon.right
                    leftMargin: 5
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
                    }
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 11
                }
            }
        }

        ListView{
            id: billsLV
            width: parent.width
            clip: true
            anchors{
                top: searchBox.bottom
                topMargin: 10
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
            }

            model: ListModel{
                id: billModel
                ListElement{
                    billTitle: "The Kenya Robotics and Artificial Intelligence Society Bill, 2023"
                    billSummary: "The Kenya Robotics and Artificial Intelligence Society Bill, 2023 is a comprehensive legislative framework designed to foster the growth of robotics and AI in Kenya. It aims to promote ethical and responsible innovation while providing guidelines for the development, deployment, and use of these technologies."
                    selected: false
                }
                ListElement{
                    billTitle: "Finance bill, 2025"
                    billSummary:"The Finance Bill, 2025 aims to introduce a comprehensive set of reforms designed to enhance the efficiency, transparency, and resilience of the country's financial system. This bill proposes several measures, including the introduction of new tax regulations to foster economic growth, the strengthening of anti-money laundering frameworks, and the establishment of guidelines for emerging financial technologies such as digital currencies and blockchain."
                    selected: false
                }
                ListElement{
                    billTitle: "The Data Protection Bill, 2024"
                    billSummary: "The Data Protection Bill, 2024 is a comprehensive legislative framework designed to safeguard the privacy and security of personal data in Kenya. It aims to establish guidelines for the collection, processing, and storage of personal information, as well as the rights and responsibilities of data subjects and data controllers."
                    selected: false
                }
                ListElement{
                    billTitle: "The Climate Change Bill, 2023"
                    billSummary: "The Climate Change Bill, 2023 is a comprehensive legislative framework designed to address the challenges of climate change in Kenya. It aims to promote sustainable development, reduce greenhouse gas emissions, and enhance the country's resilience to the impacts of climate change."
                    selected: false
                }
                ListElement{
                    billTitle: "The Employment Bill, 2024"
                    billSummary: "The Employment Bill, 2022 is a comprehensive legislative framework designed to regulate the employment relationship in Kenya. It aims to promote decent work, protect the rights of workers, and enhance the productivity and competitiveness of the labor market."
                    selected: false
                }
            }

            delegate: Rectangle{
                id: billsTile
                property bool isSelected: false
                property string defaultColor: "transparent"


                width: parent.width* .95
                height: 140
                color: model.selected ? "#75bcb5b5" : defaultColor
                border.color: model.selected ? "#bcb7b7" : defaultColor
                radius: 4
                anchors{
                    horizontalCenter: parent.horizontalCenter
                }

                Text{
                    id: titleText
                    text: model.billTitle
                    anchors{
                        top: parent.top
                        topMargin: 10
                        left: parent.left
                        leftMargin: 10
                        right: parent.right
                        rightMargin: 8
                    }
                    font.pixelSize: 14
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.DemiBold
                    elide: Text.ElideRight
                    maximumLineCount: 1
                }

                Rectangle{
                    id: billRect
                    width: parent.width
                    color: "transparent"
                    anchors{
                        top: titleText.bottom
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                        bottomMargin: 20
                    }

                    Text{
                        id: bill
                        height: parent.height
                        text: model.billSummary
                        anchors{
                            top: parent.top
                            topMargin: 7
                            left: parent.left
                            leftMargin: 10
                            right: parent.right
                            rightMargin: 8
                        }
                        font.pixelSize: 12
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        wrapMode: Text.WordWrap
                        elide: Text.ElideRight
                    }
                }

                MouseArea{
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        for(let i = 0; i < billsLV.count; i++){
                            billsLV.model.setProperty(i, "selected", false)
                        }
                        billsLV.model.setProperty(index, "selected", true)
                        billWebView.url = Qt.resolvedUrl(billArray[index])
//                        billBigTitleText.text = billWebView.title
                    }
                }
            }
            Component.onCompleted: {
                billsLV.model.setProperty(itemAtIndex(0), "selected", true)
            }
        }
    }

    Rectangle {
        id: userProfileRect
        height: 50
        width: height
        radius: width/2
        clip: true
        anchors{
            top: parent.top
            topMargin: 10
            right: parent.right
            rightMargin: 16
        }

        color: "transparent"

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

    Rectangle {
        id: optionsContainer
        width: 120
        height: 36
        color: "#75bcb5b5"
        radius: 4
        anchors{
            right: userProfileRect.left
            rightMargin: 20
            verticalCenter: userProfileRect.verticalCenter
        }

        Image {
            id: infoIcon
            source: "assets/learnInfo.png"
            height: 20
            width: 20
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 10
            }
            MouseArea{
                id: infoIconMA
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                hoverEnabled: true
                onEntered: {
                    copyTT.visible = false
                    menuTT.visible = false
                    infoTT.visible = !infoTT.visible
                }
                onExited: {
                    infoTT.visible = !infoTT.visible
                }
            }
            ToolTip{
                id: infoTT
               x: infoIconMA.mouseX +10
               y: infoIconMA.mouseY +20
               visible: false
               delay: 1000
               text: "About"
               dim: true
               timeout: 5000
            }

        }

        Image {
            id: copyIcon
            source: "assets/copy.png"
            width: 20
            height: 20
            anchors{
                verticalCenter: parent.verticalCenter
                right: infoIcon.left
                rightMargin: 10
            }
            MouseArea{
                id: copyIconMA
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                hoverEnabled: true
                onEntered: {
                    infoTT.visible = false
                    menuTT.visible = false
                    copyTT.visible = !copyTT.visible
                }
                onExited: {
                    copyTT.visible = !copyTT.visible
                }

            }

            ToolTip{
                id: copyTT
               x: copyIconMA.mouseX +10
               y: copyIconMA.mouseY +20
               visible: false
               delay: 1000
               text: "Copy"
               dim: true
               timeout: 5000
            }
        }

        Image {
            id: menuIcon
            source: "assets/menu.png"
            width: 30
            height: 20
            anchors{
                verticalCenter: parent.verticalCenter
                right: copyIcon.left
                rightMargin: 10
            }
            MouseArea{
                id: menuIconMA
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                hoverEnabled: true
                onEntered: {
                    copyTT.visible = false
                    infoTT.visible = false
                    menuTT.visible = !menuTT.visible
                }
                onExited: {
                    menuTT.visible = !menuTT.visible
                }
            }

            ToolTip{
                id: menuTT
               x: menuIconMA.mouseX +10
               y: menuIconMA.mouseY +20
               visible: false
               delay: 1000
               text: "More options"
               dim: true
               timeout: 5000
            }
        }
    }

    Rectangle{
        id: billTitleRect
        height: 40
        color: "transparent"
        anchors{
            left: billsList.right
            right: optionsContainer.left
            rightMargin: 10
            verticalCenter: optionsContainer.verticalCenter
        }

        Text {
            id: billBigTitleText
            text: billWebView.title //qsTr("The Kenya Robotics and Artificial Intelligence Society Bill, 2023")
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 10
            }
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.DemiBold
            elide: Text.ElideRight
            maximumLineCount: 1
        }
    }

    Rectangle{
        id: billDetail
        anchors{
            top: optionsContainer.bottom
            topMargin: 10
            bottom: parent.bottom
            right: parent.right
            left: billsList.right
        }

        WebEngineView{
            id: billWebView
            anchors.fill: parent
            url: Qt.resolvedUrl(billArray[0]) //Qt.resolvedUrl("assets/AIBill2023.html") //Qt.resolvedUrl("assets/group5.html")
            onLoadingChanged: {
                if(loadProgress === 100){
                    billBigTitleText.text = billWebView.title
                }
            }
        }
    }
}
