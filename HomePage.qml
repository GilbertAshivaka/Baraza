import QtQuick

Rectangle {
    id: homePage
    anchors.fill: parent

    Rectangle{
        id: mainContainer
        color: "#ebe6e6"
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        SideButtons{
            id: sideButtons
            width: parent.width* .21
            height: parent.height
            anchors{
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
        }

        Rectangle{
            id: homePageContainer
            color: "#FDFDFD"
            anchors{
                left: sideButtons.right
//                leftMargin: 20
                top: parent.top
//                topMargin: 10
                right: parent.right
                bottom: parent.bottom
            }
            Loader{
                id: homePageLoader
                anchors.fill: parent
                source: "Home.qml"
            }
        }
    }
}








