// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "common.js" as Helper
import "stringHelper.js" as StrHelper


Item {
    id: item_container
    width: 275
    height: 346
    anchors.fill: parent
    property variant obj_selected: null
    property variant obj_hoverd: null

    function onSelectItem(rect){
        if(obj_selected != null)
            obj_selected.opacity = 0
        obj_selected = rect;
        obj_selected.opacity = 0.9
    }

    function onHoverItem(rect){
        if(obj_hoverd != null)
            obj_hoverd.opacity = 0
        obj_hoverd = rect;
        if(obj_hoverd != null)
            obj_hoverd.opacity = 0.8
    }

    ListModel {
        id: buddies
        ListElement {
            name: "group1"
            isExpand: true
            attributesCount:4
            attributes: [
                ListElement {
                   displayname: "contact1"
                    mood: "mood1"
                    portrait: "images/default_1.png"
                },

                ListElement {
                   displayname: "contact2"
                    mood: "mood2"
                    portrait: "images/default_2.png"
                },

                ListElement {
                   displayname: "contact2"
                    mood: "mood2"
                    portrait: "images/default_2.png"
                },

                ListElement {
                    displayname: "contact2"
                    mood: "mood2"
                    portrait: "images/default_2.png"
                }
            ]
        }

        ListElement {
            name: "group2"
            isExpand: false
            attributesCount:2
            attributes: [
                ListElement {
                   displayname: "contact3"
                    mood: "mood3"
                    portrait: "images/default_3.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                }
            ]
        }

        ListElement {
            name: "group3"
            isExpand: true
            attributesCount:8
            attributes: [
                ListElement {
                   displayname: "contact3"
                    mood: "mood3"
                    portrait: "images/default_3.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                }
            ]
        }

        ListElement {
            name: "group5"
            isExpand: true
            attributes: [
                ListElement {
                   displayname: "contact3"
                    mood: "mood3"
                    portrait: "images/default_3.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                },

                ListElement {
                   displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                },

                ListElement {
                    displayname: "contact4"
                    mood: "mood4"
                    portrait: "images/default_4.png"
                }
            ]
        }
    }

    Component {
        id:buddyTree

        Item{
            id: rectangle1
            width: parent.width

            property bool isExpand: true
            height: isExpand ? rect_group.height + item_buddies.height : rect_group.height

            property int groupItemHeight: 24
            property int contactItemHeight: 54
            property int contactItemSpace: 2

            Behavior on height {
                NumberAnimation { duration: 100 }
            }

            Item{
                id: item_group
                width: parent.width
                height: groupItemHeight
                Rectangle{
                    id: rect_groupBg
                    anchors.fill: parent
                    opacity: 0
                    radius: 4
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#fdfeff"
                        }

                        GradientStop {
                            position: 1
                            color: "#f3f8fe"
                        }
                    }
                    anchors.rightMargin: 1
                    anchors.leftMargin: 1
                    anchors.bottomMargin: 1
                    anchors.topMargin: 1

                    Behavior on opacity {
                        NumberAnimation { duration: 200 }
                    }
                }

                Rectangle{
                    id: rect_group
                    color: "#00000000"
                    anchors.fill: parent

                    Image {
                        id: image_group_arrow
                        width: 22
                        anchors.verticalCenterOffset: 2
                        fillMode: Image.PreserveAspectFit
                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        source: Helper.image("arrowdown.png")
                        smooth: true

                        transform: Rotation {
                            origin.x: image_group_arrow.width/2
                            origin.y: image_group_arrow.height/2
                            axis { x: 0; y: 0; z: 1 }
                            angle: isExpand ? 0 : -90

                            Behavior on angle {
                                NumberAnimation { duration: 200 }
                            }
                        }

                    }

                    Text {
                        id: text1
                        y: 5
                        text: name
                        anchors.left: image_group_arrow.right
                        anchors.leftMargin: 6
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 15
                    }

                    Text {
                        id: text2
                        y: 6
                        text: qsTr(groupState)
                        anchors.left: text1.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 12
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        isExpand = !isExpand
                        //onItemClick()
                        //wndBase.buddies.get(index).isExpand = !wndBase.buddies.get(index).isExpand
                    }
                    onEntered: {
                        rect_groupBg.opacity = 0.6
                    }

                    onExited: {
                        rect_groupBg.opacity = 0
                    }
                }
            }

            Item{
                id: item_buddies
                width: parent.width
                height:  contactsCount * (contactItemHeight + contactItemSpace)

                Component.onCompleted: {
                }

                opacity: isExpand ? 1 : 0
                anchors.left: item_group.left
                anchors.leftMargin: 0
                anchors.top: item_group.bottom
                anchors.topMargin: 0

                Behavior on opacity {
                    NumberAnimation { duration: 100 }
                }

                Column{
                    spacing: contactItemSpace
                    width: item_buddies.width
                    Repeater{
                        model: contacts

                        Item{
                            height: rectangle1.contactItemHeight
                            width: item_buddies.width
//                            height: 54
//                            width: 250

                            MouseArea{
                                id: mousearea1
                                anchors.fill: parent
                                hoverEnabled: true
                                acceptedButtons: Qt.LeftButton | Qt.RightButton

                                onEntered: {
                                    onHoverItem(rect_buddyBG)
                                }

                                onExited: {
                                    onHoverItem(null)
                                }

                                onClicked: {
                                    onSelectItem(rect_buddySelected)

                                    if (mouse.button === Qt.RightButton){
                                        wnd.showContactMenu(contactId)
                                    }
                                }

                                onDoubleClicked: {
                                    wnd.doubleClickContact(contactId)
                                }

                            }

                            Rectangle{
                                id: rect_buddySelected
                                color: "#FCF0C1"
                                anchors.fill: parent
                                opacity: 0

                                Behavior on opacity {
                                    NumberAnimation { duration: 100 }
                                }
                            }

                            Rectangle{
                                id: rect_buddyBG
                                color: "#FFF9DC"
                                anchors.fill: parent
                                opacity: 0
                            }

                            Rectangle{
                                id: rect_buddy
                                color: "#00000000"
                                clip: true
                                anchors.fill: parent

//                                Rectangle {
//                                    border.color: (presence & 0x200 ) ? "red" : (presence & 0x100 ) ? "blue" : "#00000000"
//                                    anchors.top: image_portrait.top
//                                    anchors.topMargin: -1
//                                    anchors.right: image_portrait.right
//                                    anchors.rightMargin: -1
//                                    anchors.left: image_portrait.left
//                                    anchors.leftMargin: -1
//                                    anchors.bottom: image_portrait.bottom
//                                    anchors.bottomMargin: -1
//                                }

                                Rectangle{
                                    id: rect_portraitBackgroud
                                    anchors.left: parent.left
                                    anchors.leftMargin: 0
                                    anchors.top: parent.top
                                    anchors.topMargin: 0
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 0
                                    width: 54
                                    color: "#00000000"

                                    Image {
                                        id: image_portrait
                                        y: 9
                                        width: 44
                                        height: 44
                                        anchors.left: parent.left
                                        anchors.leftMargin: 10
                                        anchors.verticalCenter: parent.verticalCenter
                                        source:  presence == 0 ? "image://gray/" + portrait : portrait
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true

                                        onEntered: {
                                            var x = -mapFromItem(null, rect_buddy.x, rect_buddy.x).x
                                            var y = -mapFromItem(null, rect_buddy.y, rect_buddy.y).y
                                            wnd.showCardinfo(contactId, x, y-5)

                                            onHoverItem(rect_buddyBG)
                                        }

                                        onExited: {
                                            wnd.hideCardinfo()
                                        }

                                        onDoubleClicked: {
                                            wnd.doubleClickContact(contactId)
                                        }
                                    }
                                }


                                Rectangle{
                                    id: rect_portrait
                                    color: "#e639e1"
                                    anchors.fill: parent
                                    opacity: 0
                                }

                                Text {
                                    id: text_name
//                                    color: (presence & 0x0200 ) ? "red" : (presence & 0x0100 ) ? "blue" : "#FFFFFFFF"
                                    text: qsTr(displayname)
                                    anchors.top: parent.top
                                    anchors.topMargin: 5
                                    anchors.left: rect_portraitBackgroud.right
                                    anchors.leftMargin: 10
                                    font.pixelSize: 15
                                }

                                Text {
                                    id: text_mood
                                    color: "#a5a5a5"
                                    text: qsTr(moodParsed)
                                    anchors.top: text_name.bottom
                                    anchors.topMargin: 8
                                    anchors.left: rect_portraitBackgroud.right
                                    anchors.leftMargin: 10
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 10
                                    font.pixelSize: 15


                                    MouseArea{
                                        anchors.fill: parent
                                        hoverEnabled: true

                                        onEntered: {
                                            wnd.tip(mood)

                                            onHoverItem(rect_buddyBG)
                                        }

                                        onExited: {
                                            wnd.tip("")
                                        }

                                        onDoubleClicked: {
                                            wnd.doubleClickContact(contactId)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    ListView {
        id: listView_buddies
        cacheBuffer: 1000
        highlightFollowsCurrentItem: false
        keyNavigationWraps: true
        boundsBehavior: Flickable.StopAtBounds
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: rect_scrollView.opacity * rect_scrollView.width
        model: me.group
        delegate: buddyTree
        maximumFlickVelocity: 6000
        flickDeceleration: 4000


        onContentYChanged: {

        }
    }

    Rectangle {
        id: rect_scrollView
        width: 12
        color: "#00000000"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        opacity: listView_buddies.contentHeight > listView_buddies.height ? 1 : 0
        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        property int arrowHeight: 16
        property int arrowFixed: arrowHeight * 2 + 2
        property int scrollStart: arrowHeight + 1
        property int maxBarHeight: height - arrowFixed
        property int barY: listView_buddies.visibleArea.yPosition * maxBarHeight + scrollStart
        onBarYChanged: {
        }

        property int barHeight: listView_buddies.visibleArea.heightRatio * maxBarHeight

        Rectangle{
            id: rect_scrollBg
            color: "#00000000"
            anchors.fill: parent
            opacity: 1
            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }

            Rectangle{
                id: rect_arrowUp
                height: 16
                color: "#00000000"
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0


                Rectangle {
                    id: rect_arrowUpBg
                    color: "#00000000"
                    anchors.topMargin: 1
                    anchors.bottomMargin: 1
                    anchors.leftMargin: 0
                    anchors.rightMargin: 2
                    border.color: "#696565"
                    anchors.fill: rect_arrowUp
                    opacity: 0

                    Behavior on opacity {
                        NumberAnimation { duration: 200 }
                    }
                }


                Image {
                    id: image1
                    x: 8
                    y: 6
                    width: 15
                    height: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectFit
                    source: Helper.image("sb_up.png")
                }

                MouseArea {
                    hoverEnabled: true
                    anchors.fill:image1

                    onClicked: {

                    }

                    onEntered: {
                        rect_arrowUpBg.opacity = 1
                    }

                    onExited: {
                        rect_arrowUpBg.opacity = 0
                    }
                }
            }
            Rectangle{
                id: rect_arrowDown
                height: 16
                color: "#00000000"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0

                Rectangle {
                    id: rect_arrowDownBg
                    color: "#00000000"
                    anchors.topMargin: 1
                    anchors.bottomMargin: 1
                    anchors.leftMargin: 0
                    anchors.rightMargin: 2
                    border.color: "#696565"
                    anchors.fill: rect_arrowDown
                    opacity: 0
                    Behavior on opacity {
                        NumberAnimation { duration: 200 }
                    }
                }

                Image {
                    id: image2
                    x: 46
                    y: 134
                    width: 15
                    height: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: Helper.image("sb_down.png")
                }

                MouseArea {
                    hoverEnabled: true
                    anchors.fill:image2
                    onEntered: {
                        rect_arrowDownBg.opacity = 1
                    }
                    onExited: {
                        rect_arrowDownBg.opacity = 0
                    }
                }
            }
            Rectangle{
                id: rect_scroll
                width: parent.width
                height: parent.height - rect_scrollView.arrowFixed
                y: rect_scrollView.scrollStart
                color: "#adadad"
                radius: 4
                anchors.right: parent.right
                anchors.rightMargin: 2
                anchors.left: parent.left
                anchors.leftMargin: 2
            }
        }

        Rectangle {
            id: rect_scroll_stack
            y: rect_scrollView.barY
            height: rect_scrollView.barHeight
            color: "#efefef"
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 2
            radius: 4

            MouseArea {
                anchors.fill: parent
                drag.target: rect_scroll_stack
                drag.axis: Drag.YAxis
                drag.minimumY: rect_scrollView.scrollStart
                drag.maximumY: rect_scrollView.maxBarHeight - rect_scrollView.barHeight + rect_scrollView.scrollStart
                acceptedButtons: Qt.LeftButton
                // 拖动
                onMouseYChanged: {
                    //rect_scroll_stack.y = listView_buddies.visibleArea.yPosition * maxBarHeight + scrollStart

                    //listView_buddies.contentY = (rect_scroll_stack.y - rect_scrollView.scrollStart) / rect_scrollView.maxBarHeight
                    listView_buddies.contentY = (rect_scroll_stack.y - rect_scrollView.scrollStart) * listView_buddies.contentHeight / listView_buddies.height
                    // 678 = (224 - 17)*1024/346
                }
            }

        }
    }
}
