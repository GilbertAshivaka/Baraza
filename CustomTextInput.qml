import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Rectangle{
    id: textInputRect
    radius: 4
    width: parent.width* .48
    height: 40
    border.color: textInput.activeFocus ? "#907FBF" : "transparent" //"#D2D2D2"
    property string placeHolderText: ""
    color: "#5F5E65"  //"transparent"
    property string m_echoMode: "NoEcho"

    MouseArea{
        id: textInputMA
        anchors.fill: parent
        cursorShape: "IBeamCursor"

        TextInput{
            id: textInput
            clip: true
            anchors{
                right: parent.right
                rightMargin: 5
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                leftMargin: 5
            }

            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 16
            color: "white"
        }
    }

    Text{
        id: textInputPlaceHolder
        visible: textInput.text === ""
        color: "white"
        text: placeHolderText
        anchors{
            left: parent.left
            leftMargin: 5
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: 16
        verticalAlignment: Text.AlignVCenter
    }
}
