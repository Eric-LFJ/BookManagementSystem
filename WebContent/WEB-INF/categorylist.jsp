<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Book List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body style="background: url('image/背景图片4.jpg'); background-size:100% 100% ; background-attachment: fixed">
<script type="text/javascript">
function buttonClick(obj){
	var a = document.getElementById('categoryname');
	a.value=obj.id;
}
</script>
	<!-- 引入jquery -->
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- java script -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
		
	<!-- 导航栏 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath }/login.jsp">Login/Register<span class="sr-only">(current)</span></a></li>
					<li><a href="${pageContext.request.contextPath }/home.do">Home</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li style="margin-right: 20px; color: #777777; margin-top: 15px"><B>Hello,${username }</B></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Personal Center<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath }/userorderbook.do">Order</a></li>
							<li><a href="${pageContext.request.contextPath }/userrentbook.do">Rent</a></li>
							<li><a href="${pageContext.request.contextPath }/userovertime.do">Overtime</a></li>
							<li><a href="${pageContext.request.contextPath }/userreturnback.do">Return</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="${pageContext.request.contextPath }/changePassword.do">Change Password</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 所有书籍类型列表 -->
	<div style="margin-top: 80px">
	</div>
	<div style="padding-left: 300px; padding-right: 300px">
		<form action="${pageContext.request.contextPath }/bookOfCategory.do">
			<input type="text" id="categoryname" name="categoryname" hidden="hidden"/>
			<table class="table table-hover">
				<tr>
					<td><b>Category</b></td>
					<td></td>
				</tr>
				<c:forEach items="${categorylist }" var="category">
					<tr>
						<td>${category }</td>
						<td><button type="submit" id="${category }" onclick="buttonClick(this);">show</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
	
</body>
</html>