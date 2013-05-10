import QtQuick 1.1
import QtWebKit 1.0
import "common.js" as Helper
import "stringHelper.js" as StrHelper


Item {
    property alias browser: webView.web
    property alias url: webView.url
    property alias flicker: webView

    FlickableWebView {
        id: webView
        anchors.fill: parent
        web.onLoadStarted: {

            webView.visible = false
            rectLoading.visible = true
            txtLoading.text = StrHelper.translate("Web_Loading")
        }

        web.onLoadFinished: {
            webView.visible = true
            rectLoading.visible = false
        }

        web.onLoadFailed: {
            webView.visible = false
            txtLoading.text = StrHelper.translate("Web_Failure")
        }
    }

    ScrollBar {
        scrollArea: webView; width: 8
        anchors { right: parent.right; top: parent.top; bottom: parent.bottom }
    }

    ScrollBar {
        scrollArea: webView; height: 8; orientation: Qt.Horizontal
        anchors { right: parent.right; rightMargin: 8; left: parent.left; bottom: parent.bottom }
    }

    Rectangle{
        id: rectLoading
        anchors.fill: parent
        Text {
            id: txtLoading
            x: 179
            y: 180
            text: StrHelper.translate("Web_Loading")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }
    }

}
