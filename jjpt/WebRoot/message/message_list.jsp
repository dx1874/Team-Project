<%@include file="/common/sub_header.jsp"%>	
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>	
<style type="text/css">	
<!--	
body {	
	margin-left: 0px;	
	margin-top: 0px;	
	margin-right: 0px;	
	margin-bottom: 0px;	
}	
	
.tabfont01 {	
	font-family: "宋体";	
	font-size: 9px;	
	color: #555555;	
	text-decoration: none;	
	text-align: center;	
}	
	
.font051 {	
	font-family: "宋体";	
	font-size: 12px;	
	color: #333333;	
	text-decoration: none;	
	line-height: 20px;	
}	
	
.font201 {	
	font-family: "宋体";	
	font-size: 12px;	
	color: #FF0000;	
	text-decoration: none;	
}	
	
.button {	
	font-family: "宋体";	
	font-size: 14px;	
	height: 37px;	
}	
	
html {	
	overflow-x: auto;	
	overflow-y: auto;	
	border: 0;	
}	
-->	
</style>	
<form name="form1" action="message!queryMessage.action" method="post">	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">	
		<tr>	
			<td height="30">	
				<table width="100%" border="0" cellspacing="0" cellpadding="0">	
					<tr>	
						<td height="62" background="images/nav04.gif">	
	
							<table width="98%" border="0" align="center" cellpadding="0"	
								cellspacing="0">	
								<tr>	
									<td width="24">	
										<img src="images/ico07.gif" width="20" height="18" />	
									</td>	
									<td width="519">	
										账号：	
	
										<input type="text" name="message.appuser" value="${message.appuser}"	
											clazz="box1" />	
										<input name="Submit" onclick="query();" type="button"	
											class="right-button02" value="查 询" />	
									</td>	
									<td width="679" align="left">	
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
									</td>	
								</tr>	
							</table>	
	
						</td>	
					</tr>	
				</table>	
			</td>	
		</tr>	
		<tr>	
			<td>	
				<table id="subtree1" style="DISPLAY: " width="100%" border="0"	
					cellspacing="0" cellpadding="0">	
	
					<tr>	
						<td>	
							<table width="95%" border="0" align="center" cellpadding="0"	
								cellspacing="0">	
	
								<tr>	
									<td height="20" align="right">	
	
									
										
										<input onclick="delMessage();" type="button"	
											class="right-button08" value="删除" />	
										<input onclick="viewMessage();" type="button"	
											class="right-button08" value="回复" />	
									</td>	
								</tr>	
								<tr>	
									<td height="40" class="font42">	
										<table width="100%" border="0" cellpadding="4" cellspacing="1"	
											bgcolor="#464646" class="newfont03">	
											<tr>	
												<td height="20" colspan="14" align="center"	
													bgcolor="#EEEEEE" class="tablestyle_title">	
	
													留言信息列表	
												</td>	
											</tr>	
											<fmt:bundle basename="global_resources">	
												<display:table style="width:100%; text-align:center;"	
													name="message_list" class="simple" excludedParams="method"	
													id="message" pagesize="10" partialList="true" defaultsort="1"	
													defaultorder="descending" size="resultSize"	
													requestURI="message!queryMessage.action">	
													<display:column style="width:10%; text-align:center;"	
														title="选择">	
														<input type="radio" name="id" value="${message.id}"	
															headerClass="sortable" />	
													</display:column>	
													<display:column title="发布人" sortable="true"	
														style="width:15%; text-align:center;">	
                           ${message.appuser}	
                        </display:column>	
													<display:column title="内容" sortable="true"	
														style="width:15%; text-align:center;">	
                           ${message.msg}	
                        </display:column>	
                        <display:column title="发布日期" sortable="true"	
														style="width:15%; text-align:center;">	
                           ${message.date}	
                        </display:column>	
                       
													<display:column title="回复内容" sortable="true"	
														style="width:15%; text-align:center;">	
                           ${message.reply}	
                        </display:column>	
                        <display:column title="回复日期" sortable="true"	
														style="width:15%; text-align:center;">	
                           ${message.replydate}	
                        </display:column>	
	
	
	
	
												</display:table>	
											</fmt:bundle>	
										</table>	
									</td>	
								</tr>	
							</table>	
						</td>	
					</tr>	
				</table>	
				<table width="95%" border="0" align="center" cellpadding="0"	
					cellspacing="0">	
					<tr>	
						<td height="6">	
							<img src="images/spacer.gif" width="1" height="1" />	
						</td>	
					</tr>	
					<tr>	
						<td height="33">	
							<table width="100%" border="0" align="center" cellpadding="0"	
								cellspacing="0" class="right-font08">	
	
							</table>	
						</td>	
					</tr>	
				</table>	
			</td>	
		</tr>	
	</table>	
</form>	
	
	
	
</body>	
</html>	
	
<script>	
	
function query() {	
	var action = "<%=path%>/message!queryMessage.action";	
	document.forms[0].action = action;	
	document.forms[0].submit();	
}	
	
function addMessage() {	
	var action = "<%=path%>/message!toAddMessage.action";	
	document.forms[0].action = action;	
	document.forms[0].submit();	
}	
	
function delMessage() {	
	var num = isChecked();	
	if (num == 0) {	
		$.messager.alert('警告', '请选择要删除的记录！', 'warning');	
	} else {	
		$.messager.confirm('提示', '是否确认删除所选记录！', function(r) {	
			if (r) {	
	
				var action = "<%=path%>/message!delMessage.action";	
				document.forms[0].action = action;	
				document.forms[0].submit();	
			}	
		});	
	}	
}	
	
function editMessage() {	
	var num = isChecked();	
	if (num == 0) {	
		$.messager.alert('警告', '请选择要编辑的记录！', 'warning');	
	} else {	
		if (num > 1) {	
			$.messager.alert('警告', '一次只能编辑一条记录！', 'warning');	
		} else {	
	
			var action = "<%=path%>/message!toEditMessage.action";	
			document.forms[0].action = action;	
			document.forms[0].submit();	
	
		}	
	}	
}	
	
function viewMessage() {	
	var num = isChecked();	
	if (num == 0) {	
		$.messager.alert('警告', '请选择要查看的记录！', 'warning');	
	} else {	
		if (num > 1) {	
			$.messager.alert('警告', '一次只能查看一条记录！', 'warning');	
		} else {	
	
			var action = "<%=path%>/message!viewMessage.action";	
			document.forms[0].action = action;	
			document.forms[0].submit();	
		}	
	}	
}	
	
$(document).ready(function() {	
	var $messageInfo = $("#messageInfo").val();	
	if ($messageInfo != null && $messageInfo != "") {	
		$.messager.show( {	
			title : '提示',	
			msg : $messageInfo,	
			timeout : 2000,	
			showType : 'slide'	
		});	
		$("#messageInfo").val("");	
	}	
});	
</script>	
