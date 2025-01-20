import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Effects
import Qt5Compat.GraphicalEffects

Rectangle {
    id: loginPage
    anchors.fill: parent
    color: "#434353"
    clip: true

    property var bgImages: [
        "assets/freedomKenya.jpg",
        "assets/freedomKenya2.jpeg",
        "assets/kenyaFlag3.jpeg",
        "assets/mashujaa.jpg"
    ]
    property string myColor: "#6D53B4"

    MouseArea{
        id:loginPageMA
        anchors.fill: parent
    }

    Rectangle {
        id: landingImageRect
        height: parent.height* .98
        width: parent.width/2
        radius: 16
        clip: true
        anchors{
            left: parent.left
            leftMargin: 10
            verticalCenter: parent.verticalCenter
        }

        color: "transparent"

        Image {
            id: sourceItem
            source: "assets/kenyaFlag3.jpeg" //bgImages[Math.floor(Math.random()* bgImages.length)]
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
                radius: 16
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
                    sourceItem.source = fileUrl
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

        Text {
            id: someText
            text: qsTr("Baraza")
            font.pixelSize: 24
            color: "white"
            anchors{
                top: parent.top
                topMargin: 10
                left: parent.left
                leftMargin: 10
            }
        }

        Text {
            id: callActionText
            text: qsTr("Your voice matters, \nlets make you heard")
            font.pixelSize: 30
            color: "white"
            anchors{
                bottom: parent.bottom
                bottomMargin: 100
                horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle{
            id: continueRect
            width: Math.max(100, continueText.width + 20 + continueIcon.width)
            height: 20
            radius: 25
            color: Qt.rgba(255,255, 255, 0.5) //"#DBE0E7"
            anchors{
                right: parent.right
                rightMargin: 16
                verticalCenter: someText.verticalCenter
            }

            Text {
                id: continueText
                text: "Continue as guest"
                anchors{
                    left: parent.left
                    leftMargin: 4
                    verticalCenter: parent.verticalCenter
                }

                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                color: "white"
            }

            Image {
                id: continueIcon
                source: "assets/continue.png"
                height: parent.height* .7
                width: height
                anchors{
                    right: parent.right
                    rightMargin: 10
                    verticalCenter: parent.verticalCenter
                }
            }
        }

        Rectangle{
            id: nav1
            width: 40
            height: 4
            radius: 2
            color: Qt.rgba(255, 255, 255, 0.4)
            anchors{
                top: callActionText.bottom
                topMargin: 40
                horizontalCenter: callActionText.horizontalCenter
            }
        }

        Rectangle{
            id: nav2
            width: 40
            height: 4
            radius: 2
            color: "white"
            anchors{
                left: nav1.right
                leftMargin: 6
                verticalCenter: nav1.verticalCenter
            }
        }

        Rectangle{
            id: nav3
            width: 40
            height: 4
            radius: 2
            color: Qt.rgba(255, 255, 255, 0.4)
            anchors{
                right: nav1.left
                rightMargin: 6
                verticalCenter: nav1.verticalCenter
            }
        }
    }

    Item {
        id: rightConatiner
        anchors{
            left: landingImageRect.right
            leftMargin: 10
            top: landingImageRect.top
            bottom: landingImageRect.bottom
            right: parent.right
            rightMargin: 10
        }

        Item {
            id: createAccItem
            width: parent.width* .7
            height: parent.height
            anchors.centerIn: parent
            visible: true

            Text{
                id: createAccountText
                text: "Create an Account"
                font.pixelSize: 36
                color: "white"
                anchors{
                    top: parent.top
                    topMargin: 50
                    left: parent.left
                }
                wrapMode: Text.WordWrap
            }

            Text {
                id: accountQuiz
                text: qsTr("Already have an account?")
                anchors{
                    left: createAccountText.left
                    top: createAccountText.bottom
                    topMargin: 10
                }
                color: "white"
                font.pointSize: 12
                elide: Text.ElideRight
                maximumLineCount: 1
            }

            Text {
                id: loginText
                text: "Login"
                font.pointSize: 12
                color: "#907FBF"
                anchors{
                    left: accountQuiz.right
                    leftMargin: 10
                    verticalCenter: accountQuiz.verticalCenter
                }

                Rectangle {
                    id: underline
                    visible: true
                    width: loginText.width + 5  // some extra width for spacing
                    height: 1
                    color: "#907FBF"
                    anchors.top: loginText.bottom
                    anchors.horizontalCenter: loginText.horizontalCenter
                    anchors.topMargin: 0  // spacing between text and underline
                }

                MouseArea{
                    id: loginTextMA
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true

                    onClicked: {
                        createAccItem.visible = !createAccItem.visible
                        loginItem.visible = !loginItem.visible
                    }
                    onPressed: {
                        loginText.color = "gray"
                        underline.color = "gray"
                    }
                    onReleased: {
                        loginText.color = "#907FBF"
                        underline.color = "#907FBF"
                    }
                }
            }

            CustomTextInput{
                id: fnameTextInput
                width: parent.width/2 - 8
                placeHolderText: "First name"
                anchors{
                    left: parent.left
                    top: accountQuiz.bottom
                    topMargin: 32
                }
            }

            CustomTextInput{
                id: lnameTextInput
                width: parent.width/2 - 8
                placeHolderText: "Last name"
                anchors{
                    right: parent.right
                    verticalCenter: fnameTextInput.verticalCenter
                }
            }

            CustomTextInput{
                id: emailTextInput
                width: parent.width
                placeHolderText: "Enter your email"
                anchors{
                    top: fnameTextInput.bottom
                    topMargin: 20
                    left: parent.left
                    right: parent.right
                }
            }

            CustomTextInput{
                id: passwordTextInput
                width: parent.width
                placeHolderText: "Password"
                anchors{
                    top: emailTextInput.bottom
                    topMargin: 20
                    left: parent.left
                    right: parent.right
                }
            }

            Image {
                id: checkboxChecked
                source: "assets/checkboxChecked.png"
                width: 20
                height: 20
                anchors{
                    left: parent.left
                    top: passwordTextInput.bottom
                    topMargin: 20
                }
            }

            Text {
                id: termsAgreeText
                text: qsTr("Agree to the ")
                anchors{
                    left: checkboxChecked.right
                    leftMargin: 5
                    verticalCenter: checkboxChecked.verticalCenter
                }
                color: "white"
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                elide: Text.ElideRight
                maximumLineCount: 1
            }

            Text {
                id: termsText
                text: "Terms and Conditions"
                font.pointSize: 12
                color: "#907FBF"
                anchors{
                    left: termsAgreeText.right
                    leftMargin: 10
                    verticalCenter: termsAgreeText.verticalCenter
                }

                Rectangle {
                    id: underline1
                    visible: true
                    width: termsText.width + 5  // some extra width for spacing
                    height: 1
                    color: "#907FBF"
                    anchors.top: termsText.bottom
                    anchors.horizontalCenter: termsText.horizontalCenter
                    anchors.topMargin: 0  // spacing between text and underline
                }

                MouseArea{
                    id: termsTextMA
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true

                    onClicked: {

                    }
                    onPressed: {
                        termsText.color = "gray"
                        underline1.color = "gray"
                    }
                    onReleased: {
                        termsText.color = "#907FBF"
                        underline1.color = "#907FBF"
                    }
                }
            }

            PlainButton{
                id: createAccBtn
                width: parent.width
                height: 40
                text: "Create Account"
                defaultColor: "#907FBF"
                hoveredColor: myColor//"#907FBF"
                anchors{
                    left: parent.left
                    right: parent.right
                    top: checkboxChecked.bottom
                    topMargin: 20
                }
            }

            Text {
                id: altRegisterText
                text: qsTr("Or continue with ")
                anchors{
                    horizontalCenter: parent.horizontalCenter
                    top: createAccBtn.bottom
                    topMargin: 20
                }
                color: "white"
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 10
                elide: Text.ElideRight
                maximumLineCount: 1
            }

            Rectangle{
                id: decorator1
                height: 2
                color: "#A8A6AF"
                anchors{
                    left: parent.left
                    right: altRegisterText.left
                    rightMargin: 10
                    verticalCenter: altRegisterText.verticalCenter
                }
            }

            Rectangle{
                id: decorator2
                height: 2
                color: "#A8A6AF"
                anchors{
                    left: altRegisterText.right
                    leftMargin: 10
                    right: parent.right
                    verticalCenter: altRegisterText.verticalCenter
                }
            }

            Rectangle{
                id: googleRect
                radius: 4
                width: parent.width/2 -8
                height: 40
                border.color: "#A8A6AF"
                color: "transparent"
                anchors{
                    left: parent.left
                    top: altRegisterText.bottom
                    topMargin: 20
                }

                Text {
                    id: googleText
                    text: qsTr("Google")
                    anchors.centerIn: parent
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 12
                    elide: Text.ElideRight
                    maximumLineCount: 1
                }

                Image {
                    id: googleIcon
                    source: "assets/google.png"
                    height: parent.height* .50
                    width: height
                    anchors{
                        right: googleText.left
                        rightMargin: 10
                        verticalCenter: parent.verticalCenter
                    }
                }
            }

            Rectangle{
                id: appleRect
                radius: 4
                width: parent.width/2 -8
                height: 40
                border.color: "#A8A6AF"
                color: "transparent"
                anchors{
                    right: parent.right
                    verticalCenter: googleRect.verticalCenter
                }

                Text {
                    id: appleText
                    text: qsTr("Apple")
                    anchors.centerIn: parent
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 12
                    elide: Text.ElideRight
                    maximumLineCount: 1
                }

                Image {
                    id: appleIcon
                    source: "assets/apple.png"
                    height: parent.height* .50
                    width: height
                    anchors{
                        right: appleText.left
                        rightMargin: 10
                        verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Item {
            id: loginItem
            width: parent.width* .7
            height: parent.height* .5
            anchors.centerIn: parent
            visible: false

            Text{
                id: loginWithEmailText
                text: "Sign in with email"
                font.pixelSize: 24
                color: "white"
                anchors{
                    top: parent.top
                    topMargin: 10
                    left: parent.left
                }
                wrapMode: Text.WordWrap
            }

            CustomTextInput{
                id: loginEmail
                width: parent.width
                placeHolderText: "Enter your email"

                anchors{
                    top: loginWithEmailText.bottom
                    topMargin: 20
                    left: parent.left
                    right: parent.right
                }
            }

//            CustomTextInput{
//                id: loginPassword
//                width: parent.width
//                placeHolderText: "Password"
//                m_echoMode: "Password"
//                anchors{
//                    top: loginEmail.bottom
//                    topMargin: 20
//                    left: parent.left
//                    right: parent.right
//                }
//            }

            Rectangle{
                id: loginPassword
                radius: 4
                width: parent.width
                height: 40
                border.color: textInput.activeFocus ? "#907FBF" : "transparent" //"#D2D2D2"
                color: "#5F5E65"

                anchors{
                    top: loginEmail.bottom
                    topMargin: 20
                    left: parent.left
                    right: parent.right
                }

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
                        echoMode: TextInput.Password
                    }
                }

                Text{
                    id: textInputPlaceHolder
                    visible: textInput.text === ""
                    color: "white"
                    text: "Password"

                    anchors{
                        left: parent.left
                        leftMargin: 5
                        verticalCenter: parent.verticalCenter
                    }
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Text {
                id: forgotPassword
                text: "Forgot password?"
                font.pointSize: 12
                color: "#907FBF"

                anchors{
                    right: parent.right
                    rightMargin: 4
                    top: loginPassword.bottom
                    topMargin: 10
                }

                Rectangle {
                    id: underline2
                    visible: false
                    width: forgotPassword.width + 5  // some extra width for spacing
                    height: 1
                    color: "#907FBF"
                    anchors.top: forgotPassword.bottom
                    anchors.horizontalCenter: forgotPassword.horizontalCenter
                    anchors.topMargin: 0  // spacing between text and underline
                }

                MouseArea{
                    id: forgotPasswordMA
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onEntered: {
                        underline2.visible = true
                    }
                    onExited:{
                        underline2.visible = false
                    }

                    onClicked: {
                        loginItem.visible = !loginItem.visible
                        createAccItem.visible = !createAccItem.visible
                    }
                    onPressed: {
                        forgotPassword.color = "gray"
                        underline2.color = "gray"
                    }
                    onReleased: {
                        forgotPassword.color = "#907FBF"
                        underline2.color = "#907FBF"
                    }
                }
            }


            PlainButton{
                id: loginBtn
                width: parent.width
                height: 40
                text: "Sign in"
                defaultColor: "#907FBF"
                hoveredColor: myColor//"#907FBF"
                anchors{
                    left: parent.left
                    right: parent.right
                    top: forgotPassword.bottom
                    topMargin: 20
                }

                onClicked:{
                    mainLoader.source = "HomePage.qml"
                }
            }
        }
    }
}















