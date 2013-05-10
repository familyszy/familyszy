/* var main_search = qsTr("请输入关键字搜索联系人")

var web_Loading = qsTr("加载中...")
var web_LoadFaild = qsTr("加载失败")

var login_Loading = qsTr("加载中...")

var conversation_send = qsTr("发送")
var conversation_history = qsTr("历史记录")
var conversation_userinfo_info1 = qsTr("姓名")
var conversation_userinfo_info2 = qsTr("姓名")
var conversation_userinfo_info3 = qsTr("姓名")
var conversation_tab_userinfo = qsTr("用户信息")
var conversation_tab_fileTrans = qsTr("文件传输")
var conversation_tab_history = qsTr("历史记录")
var conversation_tab_fileTrans_cancel = qsTr("取消")

var cardInfo_title = qsTr("个人资料")

var liveUpdate_downloading = qsTr("下载中")
var liveUpdate_install = qsTr("安装")
var liveUpdate_failure = qsTr("下载失败") */

// var translateTable = [
                        // { "key": "Web_Loading", "value": "加载中..." },
                        // { "key": "Web_Failure", "value": "加载失败" },
                        // { "key": "Login_Loading", "value": "加载中..." },
						
                        // { "key": "MainWindow_Search", "value": "请输入关键字搜索联系人" },
						
                        // { "key": "Conversation_send", "value": "发送" },
                        // { "key": "Conversation_history", "value": "历史记录" },
                        // { "key": "Conversation_tab_userinfo", "value": "用户信息" },
                        // { "key": "Conversation_tab_fileTrans", "value": "文件传输" },
                        // { "key": "Conversation_tab_history", "value": "历史记录" },
                        // { "key": "Conversation_tab_fileTrans_cancel", "value": "取消" },
						
                        // { "key": "LiveUpdate_downloading", "value": "下载中" },
                        // { "key": "LiveUpdate_install", "value": "安装" },
                        // { "key": "LiveUpdate_failure", "value": "下载失败" }
                    // ];
					
function translate(key){
	// for(int i=0; i<translateTable.length; ++i){
		// if(translateTable[i].key == key)
			// return translateTable[i].value;
	// }
	return wnd.translate(key)
}
					
function mainFeedTable(target){

	return wnd.translate(target)
    // if(target === "mainFeed_All")
        // return qsTr("全部");
    // else if(target === "mainFeed_Status")
        // return qsTr("状态");
    // else if(target === "mainFeed_Albums")
        // return qsTr("相册");
    // else if(target === "mainFeed_Share")
        // return qsTr("分享");
    // else if(target === "mainFeed_Notes")
        // return qsTr("博客");
    // else
        // return qsTr("");
}
