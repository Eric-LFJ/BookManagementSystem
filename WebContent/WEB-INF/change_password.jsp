<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body
	style="background: url('image/背景图片4.jpg'); background-size: 100% 100%; background-attachment: fixed">
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
	<!-- 导航栏结束 -->

	<form onsubmit="return check()" action="${pageContext.request.contextPath }/changeNewPassword.do" style="margin-left: 500px; margin-right: 500px; margin-top: 150px">
		<input type="text" value="${password }" id="rightPassword" name="rightPassword" hidden="hidden">
		<div class="form-group" align="center">
			<label style="font-size: 24px" for="changePassword">Change Password</label> 
		</div>
		<div class="form-group">
			<label>Old Password</label> 
			<input type="password" class="form-control" id="oldPassword" name="oldPassword" placeholder="Old Password" required="required">
		</div>
		<div class="form-group">
			<label>New Password</label> 
			<input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New Password" required="required">
		</div>
		<div class="form-group">
			<label>New Password Again</label> 
			<input type="password" class="form-control" id="newPasswordAgain" name="newPasswordAgain" placeholder="New Password Again" required="required">
		</div>
		<button type="submit" class="btn btn-primary" style="width: 150px; margin-left: 200px">Submit</button>
	</form>
<script type="text/javascript">
function check(){
	//验证老密码是否正确
	var oldpass = document.getElementById("oldPassword").value;
	var rightpass = document.getElementById("rightPassword").value;
	if(oldpass!=rightpass){
		alert("Old password wrong!");
		return false;
	}
	//验证新密码
	var newpass = document.getElementById("newPassword").value;
	var newpasa = document.getElementById("newPasswordAgain").value;
	if(newpass.length<6||newpass.length>16)
    {
        alert("The length of the new password must be between 6 and 16 words！");
        return false;
    }
	if(newpass!=newpasa){
		alert("The two passwords must be the same!");
		return false;
	}
}
</script>

</body>
</html>