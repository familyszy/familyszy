import QtQuick 1.1

Rectangle {
    id:main
    width: 360
    height: 360
    FBDWebView{
        id: webFeed
        anchors.fill: parent
        url:"http://www.baidu.com"

        flicker.onAtYBeginningChanged: {
            if(flicker.atYBeginning)
                webFeed.browser.evaluateJavaScript("showFeed(\"top\")");
        }

        flicker.onAtYEndChanged: {
            if(flicker.atYEnd)
                webFeed.browser.evaluateJavaScript("showFeed(\"bottom\")");
        }
    }

    property bool isEnter: false
    property int mouseWheel: wnd.wheelDelta

    onMouseWheelChanged: {
        if(rectangle1.mouseWheel == 0 || !isEnter)
            return;

        //console.log("mouse wheel +" + rectangle1.mouseWheel);

        webFeed.flicker.contentY -= mouseWheel*2;//rectangle1.mouseWheel < 0 ? 10:-10

        if(webFeed.flicker.contentY < 0)
            webFeed.flicker.contentY = 0
        if(webFeed.flicker.contentY + webFeed.height > webFeed.flicker.contentHeight)
            webFeed.flicker.contentY = webFeed.flicker.contentHeight - webFeed.height
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.MiddleButton

        onEntered: {
            main.isEnter = true
        }

        onExited: {
            main.isEnter = false
        }
    }
}
