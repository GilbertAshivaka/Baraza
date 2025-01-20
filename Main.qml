import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    width: 1280
    height: 600
    visible: true
    title: qsTr("Baraza")

    Loader{
        id: mainLoader
        anchors.fill: parent
        active: true
        source: "LoginPage.qml"
    }
}
