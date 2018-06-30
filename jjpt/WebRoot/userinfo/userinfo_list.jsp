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
<form name="form1" action="userinfo!queryUserinfo.action" method="post">
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
										登录名：

										<input type="text" name="userinfo.name"
											value="${userinfo.name}" clazz="box1" />
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

										<!-- input onclick="addUserinfo();" type="button"
											class="right-button08" value="新增" />
										<input onclick="editUserinfo();" type="button"
											class="right-button08" value="编辑" / -->
										<input onclick="delUserinfo();" type="button"
											class="right-button08" value="删除" />
										<input onclick="viewUserinfo();" type="button"
											class="right-button08" value="查看" />
									</td>
								</tr>
								<tr>
									<td height="40" class="font42">
										<table width="100%" border="0" cellpadding="4" cellspacing="1"
											bgcolor="#464646" class="newfont03">
											<tr>
												<td height="20" colspan="14" align="center"
													bgcolor="#EEEEEE" class="tablestyle_title">

													会员信息列表
												</td>
											</tr>
											<fmt:bundle basename="global_resources">
												<display:table style="width:100%; text-align:center;"
													name="userinfo_list" class="simple" excludedParams="method"
													id="userinfo" pagesize="10" partialList="true"
													defaultsort="1" defaultorder="descending" size="resultSize"
													requestURI="userinfo!queryUserinfo.action">
													<display:column style="width:5%; text-align:center;"
														title="选择">
														<input type="radio" name="id" value="${userinfo.id}"
															headerClass="sortable" />
													</display:column>
													<display:column title="登录名" sortable="true"
														style="width:5%; text-align:center;">	
                           ${userinfo.name}	
                        </display:column>
													<display:column title="性别" sortable="true"
														style="width:5%; text-align:center;">	
                           ${userinfo.sex}	
                        </display:column>
													<display:column title="年龄" sortable="true"
														style="width:5%; text-align:center;">	
                           ${userinfo.age}	
                        </display:column>
													<display:column title="电话" sortable="true"
														style="width:15%; text-align:center;">	
                           ${userinfo.tel}	
                        </display:column>
													<display:column title="地址" sortable="true"
														style="width:10%; text-align:center;">	
                           ${userinfo.address}	
                        </display:column>
													<display:column title="EMAIL" sortable="true"
														style="width:10%; text-align:center;">	
                           ${userinfo.email}	
                        </display:column>
                        <display:column title="类型" sortable="true"
														style="width:5%; text-align:center;">	
                           ${userinfo.type}	
                        </display:column>
                        
                          <display:column title="授课/(求教)年级" sortable="true"
														style="width:10%; text-align:center;">	
                           ${userinfo.style}	
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
	var action = "<%=path%>/userinfo!queryUserinfo.action";
	document.forms[0].action = action;
	document.forms[0].submit();
}

function addUserinfo() {
	var action = "<%=path%>/userinfo!toAddUserinfo.action";
	document.forms[0].action = action;
	document.forms[0].submit();
}

function delUserinfo() {
	var num = isChecked();
	if (num == 0) {
		$.messager.alert('警告', '请选择要删除的记录！', 'warning');
	} else {
		$.messager.confirm('提示', '是否确认删除所选记录！', function(r) {
			if (r) {

				var action = "<%=path%>/userinfo!delUserinfo.action";
				document.forms[0].action = action;
				document.forms[0].submit();
			}
		});
	}
}

function editUserinfo() {
	var num = isChecked();
	if (num == 0) {
		$.messager.alert('警告', '请选择要编辑的记录！', 'warning');
	} else {
		if (num > 1) {
			$.messager.alert('警告', '一次只能编辑一条记录！', 'warning');
		} else {

			var action = "<%=path%>/userinfo!toEditUserinfo.action";
			document.forms[0].action = action;
			document.forms[0].submit();

		}
	}
}

function viewUserinfo() {
	var num = isChecked();
	if (num == 0) {
		$.messager.alert('警告', '请选择要查看的记录！', 'warning');
	} else {
		if (num > 1) {
			$.messager.alert('警告', '一次只能查看一条记录！', 'warning');
		} else {

			var action = "<%=path%>/userinfo!viewUserinfo.action";
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