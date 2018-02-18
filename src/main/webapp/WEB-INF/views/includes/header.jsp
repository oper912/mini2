<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Popover -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Profile Upload CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

<!-- CSS -->
<style>
.navbar-default {
	background-color: transparent;
	border-color: transparent;
	-webkit-transition: all 0.5s ease 0s;
	-o-transition: all 0.5s ease 0s;
	transition: all 0.5s ease 0s;
}

.navbar-nav {
	margin-top: 40px;
	float: right;
}

@media screen and (max-width: 767px) {
	.navbar-nav {
		float: none;
		text-align: center;
		background: rgba(25, 33, 60, 0.5);
	}
}

.navbar-default .navbar-brand {
	margin-top: 40px;
	font-size: 28px;
	font-family: 'Righteous', cursive;
	color: #fff;
	letter-spacing: 1px;
	-moz-transition: color .5s ease-in;
	-o-transition: color .5s ease-in;
	-webkit-transition: color .5s ease-in;
}

.navbar-default .navbar-brand span {
	color: #42a5f6;
	-moz-transition: color .5s ease-in;
	-o-transition: color .5s ease-in;
	-webkit-transition: color .5s ease-in;
}

@media screen and (max-width: 400px) {
	.navbar-default .navbar-brand {
		font-size: 22px;
	}
}

.navbar-default .navbar-brand:hover, .navbar-default .navbar-brand span:hover
	{
	color: #3D99B8;
}

.navbar-default .navbar-nav>li>a {
	color: #fff;
	font-size: 14px;
	font-family: 'Noto Sans', sans-serif;
	text-transform: uppercase;
	letter-spacing: 1px;
}

.navbar-default .navbar-nav>li>a:hover {
	color: #42a5f6;
}

.navbar-default .navbar-nav>li>a:focus {
	color: #42a5f6;
}

.navbar-default .navbar-toggle {
	margin-top: 40px;
	border: none;
}

.navbar-default .navbar-toggle:focus, .navbar-default .navbar-toggle:hover
	{
	background: none;
}

.navbar-default .navbar-toggle .icon-bar {
	height: 4px;
	width: 28px;
	background: #42a5f6;
}

.navbar-default.shrink {
	background: rgba(25, 33, 60, 0.8)
}

.navbar-default.shrink .navbar-nav {
	margin-top: 20px;
	margin-bottom: 10px;
}

.navbar-default.shrink .navbar-brand {
	margin-top: 20px;
}

.navbar-default.shrink .navbar-toggle {
	margin-top: 25px;
}
</style>

<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top shrink"
	role="navigation">
	<div class="container menubar">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/home">Movie <span>Trip</span></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav" id="buttonBox" ng-app="app"
				ng-controller="Ctrl">
				<button id="loginBtn" class="btn btn-hero btn-lg menubtn"
					role="button">로그인</button>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>
<div style="height: 84px"></div>
<!-- Navbar Change on Scroll -->
<!-- jQuery -->
<script src="/resources/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/js/bootstrap.min.js"></script>

<script src="/resources/js/jquery.isotope.js"></script>

<script src="/resources/js/jquery.scrollUp.min.js"></script>

<script src="/resources/js/jquery.cookie.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$(function() {
							var shrinkHeader = 100;
							$(window).scroll(function() {
								var scroll = getCurrentScroll();
								/* if (scroll >= shrinkHeader) {
									$('.navbar-default').addClass('shrink');
								} else {
									$('.navbar-default').removeClass('shrink');
								} */
							});
							function getCurrentScroll() {
								return window.pageYOffset
										|| document.documentElement.scrollTop;
							}
						});

						$('[data-toggle="popover"]')
								.popover(
										{
											html : true,
											content : function() {
												return '<div id="profileBox">'
														+ '<img id="profilePreview"/>'
														+ '</div>'
														+ '<form id="profileForm" enctype="multipart/form-data" method="post">'
														+ '<input id="profileFile" type="file" name="file" accept="image/*" />'
														+ '<button id="fileBtn" type="button"><i class="fa fa-upload"></i> 파일 선택</button><br>'
														+ '<button id="resetBtn" class="btn btn-hero btn-lg menubtn" type="button">기본 이미지로 변경</button><br>'
														+ '<button id="updateBtn" class="btn btn-hero btn-lg menubtn" type="button">프로필 이미지로 설정</button>'
														+ '</form>'
														+ '<button id="logoutBtn" class="btn btn-hero btn-lg menubtn" role="button">로그아웃</button>';
											}
										});

					});

	$('#loginBtn').click(function() {
		location.href = '/login';
	});

	if ("${login}" != '' || typeof ($.cookie('login')) != 'undefined') {
		var userimg = "${userimg}";
		if (typeof ($.cookie('userimg')) != 'undefined') {
			userimg = $.cookie('userimg');
		}
		if (userimg != "") {
			$("#buttonBox")
					.html(
							'<img title="프로필" data-placement="bottom" data-toggle="popover" id="mypage" src="/userimg?fileName='
									+ userimg
									+ '" style="width:40px; height:40px; border-radius: 50%"/>');

		} else {

			$("#buttonBox")
					.html(
							'<img title="프로필" data-placement="bottom" data-toggle="popover" id="mypage" src="/resources/images/profileimg/profileimg.png" style="width:40px; height:40px; border-radius: 50%"/>');
		}
	}

	$('#buttonBox')
			.on(
					"click",
					"*",
					function(e) {

						switch ($(this)[0].id) {
						case "loginBtn":
							console.log("로그인눌림");
							location.href = '/login';
							break;
						case "mypage":
							console.log("프로필눌림");
							$('[data-toggle="popover"]').popover();
							break;
						case "logoutBtn":
							console.log("로그아웃눌림");
							location.href = '/logout';
							$("#buttonBox")
									.html(
											'<button id="loginBtn" class="btn btn-hero btn-lg" role="button">로그인</button>');

							break;
						case "fileBtn":
							console.log("아이콘눌림");
							$("#profileFile").click();
							break;
						case "resetBtn":
							console.log("리셋눌림");
							$("#profilePreview")
									.attr('src',
											'/resources/images/profileimg/profileimg.png');
							break;
						case "updateBtn":
							console.log("업데이트");

							var fileData = $("#profileFile")[0].files[0];

							console.dir(fileData);
							console.log(fileData.type);
							if (!fileData.type.startsWith("image")) {
								alert("이미지 파일만 프로필로 설정할 수 있습니다.");
								break;
							}

							var fd = new FormData();
							fd.append("file", fileData);

							$.ajax({
								url : "/profile",
								type : "POST",
								data : fd,
								dataType : 'text',
								processData : false,
								contentType : false
							}).done(
									function(result) {
										console.log("done?? : " + result);
										$("#mypage").attr("src",
												"/userimg?fileName=" + result)

									});
							break;
						}

					});

	$("#buttonBox").on("change", "#profileFile", function() {
		readURL($(this)[0]);
		console.log("change");
	});

	var profileForm = $("#profileForm");

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#profilePreview').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
