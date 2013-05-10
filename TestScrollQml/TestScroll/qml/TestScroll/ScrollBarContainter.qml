import QtQuick 1.1

Rectangle
{
    property alias barMainContainter: barContainter
    property alias barDragBlock:dragBlockRec
    property alias barScrollArea:scrollRec

    property bool isPressedAndHold: false           //Mouse is whether or not be pressed in dragBlock!
    property bool bIsPressed: false                 //Mouse is whether or not be pressed in UpAndDown' button!
    property int nDirection:-1                      //default---1;0--Up;1--Down
    property variant viewObj                       //flickAble对象
    property real rAspectRatio:0.75                 //UpBtn And DownBtn's AspectRatio
    property int  nContainterWidth:0                       //Bar's containter width
    property bool bIsWidthTo0:true                  //Bar's width whether or not to 0
    property real  rRectBtnRadius:0
    property string strUpAndDownBtnColor: "white"
    property string  strScrollAreaColor: "lightgray"
    property int    nSrcollAreaBorderWidth:1
    property string strScrollAreaBorderColor:"black"
    property string  strDragBlockColor:"gray"
    property string  strDragBlockBorderColor: "gray"
    property int    nChangestep:30


    id:barContainter
    width: nContainterWidth
    //height: parent.height
    anchors.top: parent.top
    anchors.topMargin: 0
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0
    anchors.right: parent.right
    anchors.rightMargin: 0
    //radius: 10

    function barYContinueChanged(direction)
    {
        //Up
        if(0===direction)
        {
            if((dragBlockRec.y-nChangestep)<=0)
            {
               dragBlockRec.y  = 0
               viewObj.contentY = 0
               console.log("UpEnd")

            }else
            {
              viewObj.contentY -=nChangestep
            }

             console.log("DragblockY:"+dragBlockRec.y)
        }

        //Down
        if(1===direction)
        {
            if((dragBlockRec.y+nChangestep)>=scrollRec.height-dragBlockRec.height)
            {
                dragBlockRec.y = scrollRec.height-dragBlockRec.height
                viewObj.contentY = viewObj.contentHeight-viewObj.height
                console.log("DownEnd")

            }else
            {
                viewObj.contentY+=nChangestep
            }

            console.log("DragblockY:"+dragBlockRec.y)
        }



    }


    Timer
    {
        id:myTimer
        interval: 100
        running: bIsPressed
        repeat: true
        triggeredOnStart:bIsPressed

        onTriggered:
        {
            console.log("Timer Is Start!")

            barYContinueChanged(nDirection)

        }
    }


    Rectangle
    {
       id:btnUp
       width:parent.width
       height:rAspectRatio*width
       radius:rRectBtnRadius
       anchors.top:parent.top
       anchors.topMargin: 0
       smooth:true
       color:strUpAndDownBtnColor
       clip:true

       Image
       {
           id:imgUp
           anchors.fill: parent
           asynchronous: true
           smooth:true
           fillMode: Image.Stretch
           width:parent.width
           height:parent.height
           source:qsTr("qrc:/image/img/scrollbar_NormalUpBtn_.png")
           opacity: 1
       }

       MouseArea
       {
           id:upArea
           anchors.fill: parent

           onEntered:
           {
             imgUp.source = qsTr("qrc:/image/img/scrollbar_HoverUpBtn.png")
           }

           onExited:
           {
               imgUp.source = qsTr("qrc:/image/img/scrollbar_NormalUpBtn_.png")
           }


           onClicked:
           {

                imgUp.source = qsTr("qrc:/image/img/scrollbar_HoverUpBtn.png")

               //function
               if(dragBlockRec.y-nChangestep<=0)
               {
                   dragBlockRec.y = 0
                    viewObj.contentY = 0
                   console.log("UpEnd")

               }else
               {
                   viewObj.contentY -=nChangestep
               }

               console.log("DragBlockY:"+dragBlockRec.y)
           }

           onPressAndHold:
           {
               //function
               nDirection = 0
               bIsPressed = true
           }

           onReleased:
           {
               //function
               //imgUp.source = qsTr("qrc:/image/img/scrollbar_HoverUpBtn.png")
               nDirection = -1
               bIsPressed = false
           }

       }

    }

    Rectangle
    {
        id:btnDown
        width:parent.width
        height:rAspectRatio*width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        radius:rRectBtnRadius
        smooth:true
        color:strUpAndDownBtnColor
        clip:true

        Image
        {
            id:imdDown
            anchors.fill: parent
            asynchronous: true
            smooth:true
            fillMode: Image.Stretch
            width:parent.width
            height:parent.height
            source:qsTr("qrc:/image/img/scrollbar_Normal_DownBtn.png")
            opacity: 1
        }

        MouseArea
        {
            id:downArea
            anchors.fill: parent


            onEntered:
            {
                imdDown.source = qsTr("qrc:/image/img/scrollbar_Hover_DownBtn.png")
            }

            onExited:
            {
                imdDown.source = qsTr("qrc:/image/img/scrollbar_Normal_DownBtn.png")
            }

            onClicked:
            {
                imdDown.source = qsTr("qrc:/image/img/scrollbar_Hover_DownBtn.png")

                if((dragBlockRec.y+nChangestep)>=(scrollRec.height - dragBlockRec.height))
                {
                    dragBlockRec.y = scrollRec.height - dragBlockRec.height
                    viewObj.contentY = viewObj.contentHeight-viewObj.height
                    console.log("DownEnd")
                }else
                {
                    viewObj.contentY +=nChangestep
                }

                console.log("DragBlockY:"+dragBlockRec.y)
            }

            onPressAndHold:
            {
                nDirection = 1
                bIsPressed = true
            }

            onReleased:
            {
                //imdDown.source = qsTr("qrc:/image/img/scrollbar_Hover_DownBtn.png")
                nDirection = -1
                bIsPressed - false
            }
        }


    }

    Rectangle
    {
        id:scrollRec
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: btnUp.bottom
        anchors.topMargin: 0
        anchors.bottom: btnDown.top
        anchors.bottomMargin: 0
        color: strScrollAreaColor
        border.width: nSrcollAreaBorderWidth
        border.color: strScrollAreaBorderColor
        radius:rRectBtnRadius

        MouseArea
        {
            id:scrollArea
            anchors.fill: parent

            onClicked:
            {
                //function
                if(mouseY<dragBlockRec.y)
                {
                    if((dragBlockRec.y-nChangestep)<=0)
                    {
                        dragBlockRec.y = 0

                    }else
                    {
                       viewObj.contentY -=nChangestep
                    }
                }

                if(mouseY>dragBlockRec.y+dragBlockRec.height)
                {
                    if((dragBlockRec.y+nChangestep)>=scrollRec.height-dragBlockRec.height)
                    {
                        dragBlockRec.y = scrollRec.height -dragBlockRec.height
                    }else
                    {
                       viewObj.contentY += nChangestep
                    }

                }

                 console.log("Mouse be Clicked!")

            }

        }

        Rectangle
        {
            id:dragBlockRec
            width:parent.height
            height: viewObj.visibleArea.heightRatio * scrollRec.height
            color: strDragBlockColor
            border.width: nSrcollAreaBorderWidth
            border.color:strDragBlockBorderColor
            radius: rRectBtnRadius

            MouseArea
            {
                id:blockArea
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY:scrollRec.height - dragBlockRec.height

                onPressAndHold:
                {
                    //function

                    isPressedAndHold = true
                    viewObj.contentY =  Math.floor((dragBlockRec.y*viewObj.contentHeight)/scrollRec.height)
                }

                onReleased:
                {
                    //function
                    isPressedAndHold = false
                }


                onMouseYChanged:
                {
                    //function
                    viewObj.contentY = Math.floor((dragBlockRec.y*viewObj.contentHeight)/scrollRec.height)
                }

            }

        }

    }

}
