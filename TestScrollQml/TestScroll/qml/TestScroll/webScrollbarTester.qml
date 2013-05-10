import QtQuick 1.1
import QtWebKit 1.0

Rectangle {
    width: 640
    height: 480

    FlickableWebView{
        id: webView
        anchors.fill: parent
        url:"http://www.163.com"
    }
    ScrollBar {
        scrollArea: webView; width: 8
        anchors { right: parent.right; top: parent.top; bottom: parent.bottom }
    }

    ScrollBar {
        scrollArea: webView; height: 8; orientation: Qt.Horizontal
        anchors { right: parent.right; rightMargin: 8; left: parent.left; bottom: parent.bottom }
    }
}
