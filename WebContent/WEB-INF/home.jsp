<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
.slide {
	position: relative;
	width: 35%;
	height: 400px;
	overflow: hidden;
	margin-left: 500px;
	margin-top: 20px;
}

ul, ol {
	text-decoration: none;
	list-style: none;
}

ul.slide-img li {
	height: 400px;
	overflow: hidden;
	display: none;
	position: absolute;
	left: 0;
	top: 0;
}

ul.slide-number {
	font-size: 0;
	position: absolute;
	left: 0;
	bottom: 20px;
	z-index: 2;
	width: 100%;
	text-align: center;
}

ul.slide-number li {
	font-size: 16px;
	background: #333;
	text-align: center;
	width: 20px;
	height: 20px;
	line-height: 20px;
	border-radius: 50%;
	margin: 5px;
	display: inline-block;
	cursor: pointer;
}

.slide .btn {
	cursor: pointer;
	width: 30px;
	height: 60px;
	position: absolute;
	top: 50%;
	font-size: 30px;
	margin-top: -30px;
	background: rgba(255, 255, 255, .5);
	text-align: center;
	line-height: 60px;
	transition: all .3s;
	-webkit-transition: all .3s;
	display: none;
}

.slide:hover .btn {
	display: block;
}

.slide .left {
	left: 0;
}

.slide .right {
	right: 0;
}

.slide .slide-number li.active {
	background: #a00;
}
</style>
</head>
<body style="background: url('image/背景图片4.jpg'); background-size:100% 100% ; background-attachment: fixed">
	<!-- 引入jquery -->
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- java script -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			//初始化图片个数
			var size = $(".slide-img li").size();
			for (var i = 1; i <= size; i++) {
				var li = "<li>" + i + "</li>";
				$(".slide-number").append(li);
			}

			//手动控制轮播
			$(".slide-number li").eq(0).addClass("active");
			$(".slide-img li").eq(0).show();
			$(".slide-number li").mouseover(
					function() {
						$(this).addClass("active").siblings().removeClass(
								"active");
						var index = $(this).index();
						//如果不加这行，鼠标离开时index不与i相等，i=index保证接着往后走
						i = index;
						$(".slide-img li").eq(index).stop().fadeIn(500)
								.siblings().stop().fadeOut(500);
					});

			//自动轮播
			var i = 0;
			var t = setInterval(animates, 5000);
			//核心代码
			function animates() {
				i++;
				if (i == size) {
					i = 0;
				}
				$(".slide-number li").eq(i).addClass("active").siblings()
						.removeClass("active");
				$(".slide-img li").eq(i).fadeIn(500).siblings().fadeOut(500);
			}
			//核心向左
			function animatesL() {
				i--;
				if (i == -1) {
					i = size - 1;
				}
				$(".slide-number li").eq(i).addClass("active").siblings()
						.removeClass("active");
				$(".slide-img li").eq(i).fadeIn(500).siblings().fadeOut(500);
			}
			//hover时停止播放图片
			$(".slide").hover(function() {
				clearInterval(t);
			}, function() {
				t = setInterval(animates, 5000);
			});

			//左右轮播
			$(".left").click(function() {
				animatesL();
			});
			$(".right").click(function() {
				animates();
			});
		});
	</script>

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
	<!-- 搜索书籍 -->
	<div style="background-color: rgba(255,255,255,0.5); width: 100%; height: 150px; margin-top: -20px">
		<div align="center" style="padding-top: 60px">
			<form action="${pageContext.request.contextPath }/search.do"
				method="post">
				<input type="text" style="height: 30px; width: 400px"
					name="bookname" />
				<button type="submit"
					style="border-radius: 7px; height: 35px; width: 100px; background-color: #8c222c; color: #ffffff">Search</button>
			</form><br/>
			<a href="${pageContext.request.contextPath }/allCategory.do">All Category</a>
		</div>
	</div>
	<!-- 搜索书籍结束 -->
	<!-- 主页推荐的书籍 -->
	<div class="slide">
		<ul class="slide-img">
			<li><a href="#"><img src="image/哈利波特.jpg"></a></li>
			<li><a href="#"><img src="image/小王子.png"></a></li>
		</ul>
		<ul class="slide-number">
		</ul>
		<div class="left btn"></div>
		<div class="right btn"></div>
	</div>
	<!-- 推荐书籍结束 -->
</body>
</html>