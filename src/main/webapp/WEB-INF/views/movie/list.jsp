<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Homepage</title>
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value="/resources/css/tab.css" />" rel="stylesheet">
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
    
    <div id="report">
    	<div class="container" style="text-align: center">
			<div class="topBtn">
				<ul class="tab-group">
					<li class="tab active movieBtn" ><a href="#signup" style="border-radius:15px 0px 0px 15px;">Movie</a></li>
					<li class="tab locationBtn" ><a href="#login" style="border-radius:0px 15px 15px 0px;">Location</a></li>
				</ul>
			</div>
			
    		
    		<div class="col-md-8 col-md-offset-2" id="listDiv">
             	<form id="searchForm" method="get" action='/movie/list'>
              		<div class="input-group">
                 		<input class="btn btn-lg" type="text" name="search" <c:if test="${!empty skeyword}"> required value="${skeyword}"</c:if>>
                 		<button class="btn btn-info btn-lg" type="submit" id="sBtn">검색</button>
             		 </div>
            	</form>
			</div> 
			<a href="/movie/insert"><button class="btn btn-info btn-lg" type="button" id="registerBtn">글쓰기</button></a>
    		
    		<div id="reportBox">
    			<ul class="thumbnails">
					<c:forEach items="${list}" var="report">
						<li class="col-sm-4">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>
										<c:out value="${report.rtitle}"></c:out>
									</h4>
<!-- 									<p> -->
<%-- 										<c:out value="${report.rcontent}"></c:out> --%>
<!-- 									</p> -->
									<a class="btn btn-mini" href="/location/detail">Read More <i
										class="fa fa-angle-double-right" aria-hidden="true"></i></a>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
    		</div>

				 <div id="reportPage">
					 <ul class="pagination mypage" style="margin: 0 auto;">
					    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">Next</a></li>
					  </ul>
				</div>    
                              
    	</div>
    	<!-- <button id="testBtn">test</button> -->
    </div>
    
    
	<c:import url="../includes/footer.jsp"></c:import>

	<form id="actionForm" method="get" action='/movie/list'>
    	<input type="hidden" name="page" value="${criteria.page}">
    	<input type="hidden" name="rno">
    	<input type="hidden" name="size" value="${criteria.size}">
    	<input type="hidden" name="search">
    </form>

    <!-- jQuery -->
    <script src="/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/js/bootstrap.min.js"></script>
    
    <script src="/resources/js/jquery.isotope.js"></script>
    
    <script src="/resources/js/jquery.scrollUp.min.js"></script>
    <script src="/resources/js/pagenation.js"></script>
    
	<script type="text/javascript">
	
	$('a[href^="#"]').on('click', function(event) {
    	var target = $(this.getAttribute('href'));
    	if( target.length ) {
       		event.preventDefault();
        	$('html, body').stop().animate({
            	scrollTop: target.offset().top
        	}, 1000);
    	}
	});

	</script>
    
    
	<!-- Scroll To Top Settings -->
    <script type="text/javascript">
    
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

	<script>
	
	$(".movieBtn").on("click", function () {
		location.href='/movie/list';
	});
	
	$(".locationBtn").on("click", function () {
		location.href='/location/main';
	});
	
    $(document).ready(function() {
    	
    	var actionForm = $("#actionForm");
		var result = '${result}';
    	var pageResult = makePage({page:${criteria.page}, total:${total}, size:${criteria.size}, blocksize:${criteria.blockSize}});
    	var searchForm = $("#searchForm");
    	/* console.log("page : " + ${criteria.page});
    	console.log("total : " + ${total});
    	console.log("size : " + ${criteria.size}); */
    	$(".target").on("click", function(event) {
    		
    		event.preventDefault();
    		
    		var rno = $(this).attr("href");
    		
    		//alert(bno);
    		
    		actionForm.find("input[name='rno']").val(rno);
    		
    		actionForm.attr("action", "/movie/detail").submit();
    		
    	});
    	
    	$(".mypage").on("click", "li > a", function(event) {
    		
    		event.preventDefault();
    		
    		var pageNum = $(this).attr("href");
    		
    		//alert($(this).attr("class") + " disabled");
    		//alert("PAGE: " + pageNum);
    		//$(this).attr("class").val($(this).attr("class") + " disabled");
    		
    		actionForm.find("input[name='page']").val(pageNum);
    		actionForm.find("input[name='search']").val(searchForm.find("input[name='search']").val());
    		actionForm.submit();
    		
    	});
    	
    	$("#sBtn").on("click", function(event) {
    		event.prevebtDefault();
    		
    		searchForm.submit();
    	});
    	
    	var str = "";
    	
    	if(pageResult.prev) {
    		str += "<li class='page-item'><a class='page-link' href=" + (parseInt(pageResult.first) - 1) + ">Prev</a></li>";
    	}
    	
    	for(var i = pageResult.first; i <= pageResult.last; i++) {
    		str += "<li class='page-item " + (pageResult.page == i ? "active" : "") + "' ><a class='page-link' href=" + i + ">" + i + "</a></li>";
    	}
    	console.log($(".page-item:active > a"));
    	
    	if(pageResult.next) {
    		str += "<li class='page-item'><a class='page-link' href=" + (parseInt(pageResult.last) + 1) + ">Next</a></li>";
    	}
    	
    	$(".mypage").html(str);
    	
    	//console.log(pageResult);
    	
    	if(result === 'success') {
    		alert("등록성공!!!");
    	}
    });
    
    $("#testBtn").on("click", function() {
    	$.ajax({
    		url: "/movie/test",
    		type:"post",
    		dataType: "json",
    		success: function (data) {
    			if(data){
    				for(var i = 0; i < data.length; i++){
    					//console.log(data[i].rtitle);
        				 $(".pager")
        				.append("<span id='" + data[i].rtitle + "'>" + data[i].rtitle + "</span><br>")
        				.on("click", "#" + data[i].rtitle, function() {
        						var $this = $(this);
        						//alert($("#" + data[i].rtitle) + "클릭됨");
        						//alert($this);
        						console.log($this.html());
        				});
        			}
    			}
    			
    		}
    	});
    	
    	//console.log(${testdata});
    });
    </script>
</body>

</html>