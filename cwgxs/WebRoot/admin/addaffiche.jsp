<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="img/css.css">
	

  </head>
  <script language="JavaScript">
		function check11()
			{
				
				if (document.form1.name.value == "" ) 
				{
					alert("公告名称不能为空!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.content.value == ""  )  
				{
					alert("公告内容不能为空!");
					document.form1.content.focus();
					return false;
				}
			}
</script>
<%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('名称重复!')</script><%
}
%> 
	<jsp:include flush="true" page="/servlet/SessAdminServlet"/> 
  <body>
	<div align="center">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="servlet/AddAfficheServlet" method="post" name="form1" onSubmit="return check11()">
	<table border="1" width="42%" bordercolorlight="#C0C0C0">
		<tr>
			<td height="25" align="right">公告名称：</td>
			<td height="25" align="center">
			<input type="text" name="name" size="45"></td>
		</tr>
		<tr>
			<td height="25" align="center">
			公告内容：</td>
			<td height="25" align="center">
			<textarea rows="25" name="content" cols="46"></textarea></td>
		</tr>
		<tr>
			<td height="25" align="center" colspan="2">
			<input type="submit" value="添加"></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>