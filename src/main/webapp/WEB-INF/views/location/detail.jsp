<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Homepage</title>

<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/largemap.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link rel='shortcut icon' type='image/x-icon' href='favicon.ico' />

<link href='https://fonts.googleapis.com/css?family=Noto+Sans' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Hammersmith+One' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=NTR' rel='stylesheet' type='text/css'>

</head>

<body>

<c:import url="../includes/header.jsp"></c:import>

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

.movieImg {
	width: 200px;
	height: 350px;
}

.comment {
	background: #42a5f6;
	color: #fff;
	text-decoration: none;
}

/* 스코어 별 css */
.star-rating {
  font-family: 'FontAwesome';
/*   margin: 50px auto; */
}
.star-rating > fieldset {
  border: none;
  display: inline-block;
}
.star-rating > fieldset:not(:checked) > input {
  position: absolute;
  top: -9999px;
  clip: rect(0, 0, 0, 0);
}
.star-rating > fieldset:not(:checked) > label {
  float: right;
  width: 1em;
  padding: 0 .05em;
  overflow: hidden;
  white-space: nowrap;
  cursor: pointer;
  font-size: 200%;
  color: #ff89c0;
}
.star-rating > fieldset:not(:checked) > label:before {
  content: '\f006  ';
}
.star-rating > fieldset:not(:checked) > label:hover,
.star-rating > fieldset:not(:checked) > label:hover ~ label {
  color: #ff7070;
  text-shadow: 0 0 1px #ef2b2b;
}
.star-rating > fieldset:not(:checked) > label:hover:before,
.star-rating > fieldset:not(:checked) > label:hover ~ label:before {
  content: '\f005  ';
}
.star-rating > fieldset > input:checked ~ label:before {
  content: '\f005  ';
}
.star-rating > fieldset > label:active {
  position: relative;
  top: 2px;
}
/* 별 css 끝 */
.profileImg {
	width: 40px;
    height: 40px;
    border-radius: 50%;
}

#rcontent {
	color: white;
	font-size: medium;
}

</style>

	<div id="about" style="padding: 0px;">
		<div class="container">
			<div>
			<h3 id="movieTitle">${movie.mtitle}</h3>
				<div class="movieImg" style="float: left; margin-right: 100px;">
					<img src='/resources/images/movieimg/${movie.mimg}'/></div>
				<div id="map" style="width:400px; height:290px; float: left;"></div>
			</div>
		</div>
	</div>
    
    <div id="portfolio" style="padding-top: 0px;">
    	<div class="container">
    		<h2 id="rtitle">${report.rtitle}</h2>
 
    		<div id="rcontent">
    			${report.rcontent}
    		</div>
    	</div>
    </div>
    
    <div id="blog" style="background-color: #f2fcff;">
    	<div class="container">
	   		<form id="commentForm" method="post">
	   		<input type="hidden" name="rno" value="1" id="rno">
    			<div class="star-rating">
				  <fieldset>
				    <input type="radio" id="star5" name="score" value="5" /><label for="star5" title="Outstanding">5 stars</label>
				    <input type="radio" id="star4" name="score" value="4" /><label for="star4" title="Very Good">4 stars</label>
				    <input type="radio" id="star3" name="score" value="3" /><label for="star3" title="Good">3 stars</label>
				    <input type="radio" id="star2" name="score" value="2" /><label for="star2" title="Poor">2 stars</label>
				    <input type="radio" id="star1" name="score" value="1" checked="checked" /><label for="star1" title="Very Poor">1 star</label>
				  </fieldset>
				</div>
    			<textarea class="btn btn-lg" rows="3" cols="70" name="ccontent" id="ccontent" style="text-align: left;"></textarea>
    			<button class="btn btn-info btn-lg" id="commentInsertBtn" type="button" style="height: 95px;">등록</button>
    		</form>
    		<hr>
    		<table class="table table-hover" style="width: 700px;">
    			<thaed>
    				<tr>
    					<th width="100px;"></th><th width="30px;">#</th><th width="300px;">content</th><th width="60px;">score</th><th width="150px;"></th>
    				</tr>
    			</thaed>
    			<tbody id="commentList">
    			</tbody>
    		</table>
    	</div>
    </div>

	<c:import url="../includes/footer.jsp"></c:import>

    <!-- jQuery -->
    <script src="/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/js/bootstrap.min.js"></script>
    
    <script src="/resources/js/jquery.isotope.js"></script>
    
    <script src="/resources/js/jquery.scrollUp.min.js"></script>
    
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ebc80896d6b92c30a7a86d976b01f3&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.566678, 126.978429), // 지도의 중심좌표
			level : 8
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		<c:forEach items="${marker}" var="place">
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("${place.addr}", function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === daum.maps.services.Status.OK) {

				var coords = new daum.maps.LatLng(result[0].y,
						result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new daum.maps.Marker({
					map : map,
					position : coords
				});

// 				// 인포윈도우로 장소에 대한 설명을 표시합니다
// 				var infowindow = new daum.maps.InfoWindow(
// 						{
// 							content : '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
// 						});
// 				infowindow.open(map, marker);

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
		</c:forEach>
	</script>

	<script type="text/javascript">

// 	$("#movieTitle").html("${movie.mtitle}");
// 	$(".movieImg").html("<img src='/resources/images/movieimg/" + '${movie.mimg}' + "'/>");
	
	getAllList();
	
	console.log("${login}");
	
	function getAllList() {
		$.ajax({
			url : "/comment/list",
			type : "GET",
			data : {"rno" : 1}
		}).done(function (result) {
			var html = "";
			for(var index in result){
				var comment = result[index];
				
				html += "<tr id="+ comment.cno +"><td><img class='profileImg' src='/userimg?fileName="+comment.userimg+"'/>"+"　"+comment.id
				+ "</td><td>"+comment.cno+"</td><td id='content'>"+comment.ccontent+"</td><td>"
				+ "<img src='/resources/images/scoreimg/score_"+comment.score+".png'/></td><td>";
				if("${login}" == comment.id){
					html += "<button type='button' name='update' id="+ comment.cno +" class='btn btn-info'>수정</button>"
					+ "<button type='button' name='delete' data-del="+ comment.cno +" class='btn btn-danger'>삭제</button></td></tr>";
				}
			}
			$("#commentList").html(html);
		});
	}
	
	$("tbody").on("click", "button[name=update]", function () {
		$("tr[id='"+$(this)[0].id+"']").html("<td></td><td>"+ $(this)[0].id +"</td><td><textarea id='reply' class='btn btn-lg' rows='3' cols='50' style='text-align: left;'>"+ $("tr[id='"+$(this)[0].id+"'] #content").text() 
				+ "</textarea></td><td><button data-cno='"+ $(this)[0].id +"' type='button' class='btn btn-info'>수정</button>"
				+ "<button class='btn btn-danger' id='backBtn'>취소</button></td>");
	});
	
	$("tbody").on("click", "button[data-cno]", function () {
		console.log($(this).prev().val());
		
		$.ajax({
			url : "/comment/update",
			type : "PUT",
			contentType: "application/json",
			data : JSON.stringify({
					cno : $(this).attr("data-cno"),
					ccontent : $("#reply").val()
					})
		}).done(function (result) {
			getAllList();
		});
	});
	
	$("tbody").on("click", "button[data-del]", function () {
		
		$.ajax({
			url : "/comment/delete/" + $(this).attr("data-del"),
			type : "delete"
		}).done(function (result) {
			getAllList();
		});
	});
	
	$("#commentInsertBtn").on("click", function () {
		
		if(!"${login}"){
			alert("로그인을 하시고 사용해주세요");
			location.href='/login';
		} else {
			$.ajax({
				url : "/comment/register",
				type : "POST",
				data : {
					"rno" : $("#rno").val(),
					"score" : $(":input:radio[name=score]:checked").val(),
					"ccontent" : $("#ccontent").val(),
					"id" : "${login}"
				}
			}).done(function (result) {
				$("#ccontent").val("");
				getAllList();
			});
		}
	});
	
	$("tbody").on("click", "button[id=backBtn]",function () {
		getAllList();
	});
	
    </script>
        
    <!-- Scroll To Top Settings -->
    <script>
    
    $(function () {
  		$.scrollUp({
    		scrollName: 'scrollUp', // Element ID
    		topDistance: '300', // Distance from top before showing element (px)
    		topSpeed: 600, // Speed back to top (ms)
    		animation: 'fade', // Fade, slide, none
    		animationInSpeed: 200, // Animation in speed (ms)
    		animationOutSpeed: 200, // Animation out speed (ms)
    		activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
    		scrollImg: true,
  		});
	});
    
    </script>
        
    </body>
</html>
	
