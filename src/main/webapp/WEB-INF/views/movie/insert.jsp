<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="<c:url value="/resources/css/largemap.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link rel='shortcut icon' type='image/x-icon' href='favicon.ico' />
    
	<link href='https://fonts.googleapis.com/css?family=Noto+Sans' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Hammersmith+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=NTR' rel='stylesheet' type='text/css'>

</head>

<style>

     .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
        .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
        .map_wrap {position:relative;width:100%;height:500px;}
        #menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
        .bg_white {background:#fff;}
        #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
        #menu_wrap .option{text-align: center;}
        #menu_wrap .option p {margin:10px 0;}
        #menu_wrap {width:0%}
        #menu_wrap {height:0%}
        #menu_wrap .option button {margin-left:5px;}
        #placesList li {list-style: none;}
        #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
        #placesList .item span {display: block;margin-top:4px;}
        #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        #placesList .item .info{padding:10px 0 10px 55px;}
        #placesList .info .gray {color:#8a8a8a;}
        #placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
        #placesList .info .tel {color:#009900;}
        #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
        #placesList .item .marker_ {background-position: 0 -10px;}
        #placesList .item .marker_2 {background-position: 0 -56px;}
        #placesList .item .marker_3 {background-position: 0 -102px}
        #placesList .item .marker_4 {background-position: 0 -148px;}
        #placesList .item .marker_5 {background-position: 0 -194px;}
        #placesList .item .marker_6 {background-position: 0 -240px;}
        #placesList .item .marker_7 {background-position: 0 -286px;}
        #placesList .item .marker_8 {background-position: 0 -332px;}
        #placesList .item .marker_9 {background-position: 0 -378px;}
        #placesList .item .marker_10 {background-position: 0 -423px;}
        #placesList .item .marker_11 {background-position: 0 -470px;}
        #placesList .item .marker_12 {background-position: 0 -516px;}
        #placesList .item .marker_13 {background-position: 0 -562px;}
        #placesList .item .marker_14 {background-position: 0 -608px;}
        #placesList .item .marker_15 {background-position: 0 -654px;}
        #pagination {margin:10px auto;text-align: center;}
        #pagination a {display:inline-block;margin-right:10px;}
        #pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<body>

	<!-- header  -->s
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

.detailMap {
	min-height: 700px;
	min-width: 100%;
}


.green_window {
	display: inline-block;
	width: 300px; height: 34px;
	border: 1px solid black;
	background: white;
}
.input_text {
	width: 250px; height: 21px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}
.sch_smit {
	width: 54px; height: 40px;
	margin: 0; border: 0;
	vertical-align: top;
	background: black;
	color: white;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}
.sch_smit:hover {
	background: white;
    color : black;
}

 .movieList{
width: 20%;
height: 20%;
float: left;
margin-right: 20px;
margin-top:20px;
overflow:scroll;  
overflow:auto;
overflow:hidden;
white-space:nowrap;

}
.inputList{
	border: 1px solid black;
}
.containerr{
margin: 0;
}
.fileDrop{
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
	<div id="contact">
		<div class="containerr">
			<p>
			<h2>글등록 페이지</h2>
			</p>

			<!--영화 검색  에 대한 이미지.-->
			<form id="movieselect" method="post">
				<span class='green_window'> <input type='text' name="keyword"
					class='input_text' id='input_keyword'/>
				</span> <span id="response"></span>
				<button type="button" class='sch_smit' id="keywordBtn">검색</button>
			</form>

			<div class="movieList"></div>
            <div class="movieImg"></div>
		</div>
		<br>
		<br>
		<div class="row">
			<h3>파일 업로드</h3>
			<div class="fileDrop"></div>
			
			<div class="uploadedList"></div>
		</div>


		<iframe width="40%;" height="300" frameborder="0" scrolling="no"
			marginheight="0" marginwidth="0"
			style="pointer-events: none; margin-top: 30px; margin-right: 10px;">
		</iframe>

		<!-- 지도  -->
		<div class="row">
			<div class="map_wrap col-lg-6">
			<button type="button" id="menuBtn">>></button>
			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

			<div id="inputList"></div>

			<!-- 지도 키워드 검색  -->
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							키워드 : <input type="text" id="keyword" size="15">
							<button type="submit">검색하기</button>
						</form>
					</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
			<button id="testSubmit">주소 보내기</button>
		</div>
		<div class="col-lg-6">
			<form>
				<textarea id="addrList" style="resize: none;width: 100%; height:500px;" readonly ></textarea>
			</form>
		</div>
		</div>
			
		<div class="row">
             <div class="contact-form">
               <form action="#" method="post" id="contact-form">
                  <input type="text" id="title" name="title" required="required">
                  <textarea id="content" name="content" rows="5" required="required">
        			</textarea>
                  <br>
                  <!-- <input type="submit"> -->
                  <button name="submit" id="submit" >Send Message</button>
               </form>
            </div>  
         </div>   
       </div>
	</div>
	

	<!-- 글 , 이미지  등록 -->
      <!-- <div>
             <div class="contact-form">
               <form action="#" method="post">
                  <input type="text" id="title" name="title"  placeholder="title" >
                  <textarea id="content" name="content" placeholder="content" rows="5" ></textarea>
                  <br>
                  <button name="submit" id="submit" >Send Message</button>
               </form>
            </div>  
         </div>   
         파일 업로드
         <input type="file" id="file">
       </div>    -->
       
       <form action="/movie/insert" id="totalForm" method="post">
       		<input type="hidden" name="mcode">
       		<input type="hidden" name="title" >

       		<input type="hidden" name="content">
       </form>
        	
   <!-- footer  -->
   
<c:import url="../includes/footer.jsp"></c:import>
    <!-- jQuery -->
  	  <script src="/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
     <script src="/resources/js/bootstrap.min.js"></script>
     
    <script src="/resources/js/jquery.isotope.js"></script>
    
    <script src="/resources/js/jquery.scrollUp.min.js"></script>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43ebc80896d6b92c30a7a86d976b01f3&libraries=services"></script>
    
   
   
   <script>
   var submitForm = $("#totalForm");
   
   var totalPath = [];
   
   //var testForm = $("#contact-form");
   
   $("#submit").on("click", function(e) {
	   e.preventDefault();
	   
	   submitForm.find("input[name='mcode']").val(id);

	   
	   for(var i = 0; i < dateArr.length; i++) {
			//submitForm.append("<input type='hidden' name='imgUp[" + i + "]'>");
			//submitForm.append("<input type='hidden' name='pathUp[" + i + "]'>");

			submitForm.append("<input type='hidden' name='imgUp'>");
			submitForm.append("<input type='hidden' name='pathUp'>");
			
			//submitForm.find("input[name='imgUp[" + i + "]']").val(dateArr[i]);
			//submitForm.find("input[name='pathUp[" + i + "]']").val(fileNameArr[i]);
			
			submitForm.find("input[name='imgUp']:eq(" + i + ")" ).val(dateArr[i]);
			submitForm.find("input[name='pathUp']:eq(" + i + ")").val(fileNameArr[i]);
	   }
	   
	   for(var i = 0; i < placesStr.length; i++) {
			submitForm.append("<input type='hidden' name='place'>");
			submitForm.append("<input type='hidden' name='address'>");
			
			submitForm.find("input[name='place']:eq(" + i + ")" ).val(placesStr[i]);
			submitForm.find("input[name='address']:eq(" + i + ")").val(addrStr[i]);
	   }
	   
	   submitForm.find("input[name='title']").val($("#title").val());
	   submitForm.find("input[name='content']").val($("#content").val());
	   
	   //var formTest = submitForm.find("input[name='imgUp']");
	   submitForm.submit();
	   
	   // test
	   //testForm.submit();
   }) ;
   
   var content ="";
   var movie =[];
         var check = false;
        $("#menuBtn").on("click", function () {
            //console.log("엥?");
            if(!check){
                $("#menu_wrap").animate({width: "50%"});
                $("#menu_wrap").animate({height: "80%"});
            }else {
                $("#menu_wrap").animate({height: "0px", width: "0px"});
                //$("#menu_wrap").animate({});
            }

            check ? check = false : check = true;
        });
     
    	var markers = [];
        var mapContainer = document.getElementById("map"), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(35.70994677427705, 127.56616363656814), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
        
        // 지도를 생성합니다
        var map = new daum.maps.Map(mapContainer, mapOption);

        // 장소 검색 객체를 생성합니다
        var ps = new daum.maps.services.Places();

        // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
        var infowindow = new daum.maps.InfoWindow({zIndex:1});

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new daum.maps.services.Geocoder();


        // 키워드 검색을 요청하는 함수입니다
        function searchPlaces() {

            var keyword = document.getElementById('keyword').value;

            if (!keyword.replace(/^\s+|\s+$/g, '')) {
                alert('키워드를 입력해주세요!');
                return false;
            }

         	// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
            ps.keywordSearch( keyword, function (data, status, pagination) {
                if (status === daum.maps.services.Status.OK) {
                    //console.log(data);
                    // 정상적으로 검색이 완료됐으면
                    // 검색 목록과 마커를 표출합니다
                    displayPlaces(data);

                    // 페이지 번호를 표출합니다
                    displayPagination(pagination);

                } else if (status === daum.maps.services.Status.ZERO_RESULT) {

                    // 페이지 번호를 표출합니다
                    displayPagination(pagination);

                    geocoder.addressSearch(keyword, function(result, status) {
                        //console.log(result);
                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {

                            // 검색 목록과 마커를 표출합니다
                            displayPlaces(result);
                        }
                    });
                } else if (status === daum.maps.services.Status.ERROR) {

                    alert('검색 결과 중 오류가 발생했습니다.');
                    return;

                }
            });
        }

        
        //--------test------------
        var testMarkers = [];
        
        var placesStr = [];
        var addrStr = [];
        //--------test------------
        
        // 검색 결과 목록과 마커를 표출하는 함수입니다
        function displayPlaces(places) {

            var listEl = document.getElementById('placesList'),
                menuEl = document.getElementById('menu_wrap'),
                fragment = document.createDocumentFragment(),
                bounds = new daum.maps.LatLngBounds(),
                listStr = '';

          	// 검색 결과 목록에 추가된 항목들을 제거합니다
            removeAllChildNods(listEl);

            // 지도에 표시되고 있는 마커를 제거합니다
            removeMarker();

            if(places.length > 0) {
                for ( var i=0; i<places.length; i++ ) {

                    // 마커를 생성하고 지도에 표시합니다
                    var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
                        marker = addMarker(placePosition, i, true),
                        itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                    // LatLngBounds 객체에 좌표를 추가합니다
                    bounds.extend(placePosition);

                    // 마커와 검색결과 항목에 mouseover 했을때
                    // 해당 장소에 인포윈도우에 장소명을 표시합니다
                    // mouseout 했을 때는 인포윈도우를 닫습니다
                    (function(marker, title, address) {
                        daum.maps.event.addListener(marker, 'click', function () {
                            //var newMarker;
                            //console.log(addMarker(marker.getPosition(), 0, false));
                            //console.log(address);
                            //newMarker = ;
                            //console.log(title);
                            testMarkers.push(addMarker(marker.getPosition(), 0, false));
                            title != undefined ? placesStr.push(title) : placesStr.push(address);
                            addrStr.push(address);
                            showClickList();
                        });

                        daum.maps.event.addListener(marker, 'mouseover', function() {
                            displayInfowindow(marker, title);
                        });

                        daum.maps.event.addListener(marker, 'mouseout', function() {
                            infowindow.close();
                        });

                        itemEl.onmouseover =  function () {
                            displayInfowindow(marker, title);
                        };

                        itemEl.onmouseout =  function () {
                            infowindow.close();
                        };
                    })(marker, places[i].place_name, places[i].address_name);

                    fragment.appendChild(itemEl);
                }

                // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
                listEl.appendChild(fragment);
                menuEl.scrollTop = 0;

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            }

            if(testMarkers.length > 0) {
                console.log(testMarkers.length);
                for ( var i=0; i<testMarkers.length; i++ ) {
                    addMarker(testMarkers[i].getPosition(), i, false, testMarkers[i]);
                }
            }

        }

        daum.maps.event.addListener(map, 'click', function(e) {

            searchDetailAddrFromCoords(e.latLng, function(result, status) {
                if (status === daum.maps.services.Status.OK) {
                    var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                    detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

                    var content = '<div class="bAddr">' +
                        '<span class="title">법정동 주소정보</span>' +
                        detailAddr +
                        '</div>';


                    // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                    //infowindow.setContent(content);
                    //infowindow.open(map, marker);

                    geocoder.addressSearch(result[0].address.address_name, function(result, status) {
                        //console.log(result);
                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {
                            //console.log(result[0].address.region_1depth_name);
                            testMarkers.push(addMarker(e.latLng, 0, false));
                            placesStr.push(result[0].address.address_name);
                            addrStr.push(result[0].address.address_name);
                            showClickList();
                        }
                    });
                }
            });


        });

        /* daum.maps.event.addListener(marker , 'click' , function(){
            
            movie.push(content) ;
            $("#inputList").html(movie);
            
            console.log( "movie :" +movie);
            
            $("#inputList div").on("click" ,function(){
                 
                 for(var i=0; i < movie.length ; i++){
                    
                    var mTitle = movie[i];
                    var val = document.getElementById('location').innerHTML ;
                    mTitle = document.getElementById('location').innerHTML ;
                    
                    console.log("val :" +val);
                    console.log("mTitle :" + mTitle);
                    if(mTitle == val){
                       markers.pop(mTitle);
                       $(this).remove("div");
                       movie.pop(movie);
                    }
                 }
              });
         }); */

         function searchDetailAddrFromCoords(coords, callback) {
             // 좌표로 법정동 상세 주소 정보를 요청합니다
             geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
         }
         
          // 검색결과 항목을 Element로 반환하는 함수입니다
          function getListItem(index, places) {

              var el = document.createElement('li'),
                  itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                      '<div class="info">' +
                      (places.place_name != undefined ? '   <h5>' + places.place_name + '</h5>' : '   <h5>' + places.address_name + '</h5>');

              if (places.road_address_name) {
                  itemStr += '    <span>' + places.road_address_name + '</span>' +
                      '   <span class="jibun gray">' +  places.address_name  + '</span>';
              } else {
                  itemStr += '    <span>' +  places.address_name  + '</span>';
              }

              itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                  '</div>';

              el.innerHTML = itemStr;
              el.className = 'item';

              return el;
          }

       // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
          function addMarker(position, idx, check, marker) {

              if(check) {
            	  
                  console.log("check : " + check);
                  
                  var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                      imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
                      imgOptions =  {
                          spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
                          spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                          offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                      },
                      markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                      marker = new daum.maps.Marker({
                          position: position, // 마커의 위치
                          image: markerImage
                      });

                      marker.setMap(map); // 지도 위에 마커를 표출합니다
                      markers.push(marker);  // 배열에 생성된 마커를 추가합니다
              }else {
            	  
                  console.log("check : " + check);
                  
                  var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                      imageSize = new daum.maps.Size(24, 35),  // 마커 이미지의 크기
                      markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
                  if(!marker) {
                      var marker = new daum.maps.Marker({
                          position: position, // 마커의 위치
                          image: markerImage
                      });
                  }


                  marker.setMap(map); // 지도 위에 마커를 표출합니다
                  markers.push(marker);
                  //testMarkers.push(marker);  // 배열에 생성된 마커를 추가합니다
				
                  daum.maps.event.addListener(marker, 'click', function() {
                      //console.log(testMarkers);
                      //console.log(marker);
                      for(var i = 0; i < testMarkers.length; i++) {
                          //console.log(testMarkers[i] === marker);
                          console.log("testMarker : ");
                          console.log(testMarkers[i])
                          console.log("marker : ");
                          console.log(marker);
                      }
                     
                      for(var i = 0; i < testMarkers.length; i++) {
                          //console.log(i);
                          console.log(testMarkers[i] === marker);
                          if(testMarkers[i] === marker) {
                              console.log(testMarkers[i]);
                              console.log(placesStr[i]);
                              console.log(addrStr[i]);
                              testMarkers.splice(i, 1);
                              placesStr.splice(i, 1);
                              addrStr.splice(i, 1);
                              marker.setMap(null);
                              showClickList();
                          }
                      }


                  	});
              	}
              	
				return marker;
          }
       
		function showClickList() {
			console.log("찍히나?");
			$("#addrList").html("");
			var addrText = "";
			
			for(var i = 0; i < testMarkers.length; i++) {
				addrText += addrStr[i] + "\n";
			}
			$("#addrList").html(addrText);
		}
 
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }
		    markers = [];
		}
 
        // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
        function displayPagination(pagination) {
            var paginationEl = document.getElementById('pagination'),
                fragment = document.createDocumentFragment(),
                i;

            // 기존에 추가된 페이지번호를 삭제합니다
            while (paginationEl.hasChildNodes()) {
                paginationEl.removeChild (paginationEl.lastChild);
            }

            for (i=1; i<=pagination.last; i++) {
                var el = document.createElement('a');
                el.href = "#";
                el.innerHTML = i;

                if (i===pagination.current) {
                    el.className = 'on';
                } else {
                    el.onclick = (function(i) {
                        return function() {
                            pagination.gotoPage(i);
                        }
                    })(i);
                }

                fragment.appendChild(el);
            }
            paginationEl.appendChild(fragment);
        }

        // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
        // 인포윈도우에 장소명을 표시합니다
        function displayInfowindow(marker, title) {
            var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

            infowindow.setContent(content);
            infowindow.open(map, marker);
            console.log(title);
        }
        
        // 검색결과 목록의 자식 Element를 제거하는 함수입니다
        function removeAllChildNods(el) {
            while (el.hasChildNodes()) {
                el.removeChild (el.lastChild);
            }
        }
        
        $("#testSubmit").on("click", function() {
        	$.ajax({
        		 url: "/movie/test2",
                 type:"POST",
                 data: {"places":placesStr, "addr":addrStr},
                 dataType: "json",
                 success: function (data) {
                	 console.log("된다!!");
                 }
        	});
        });

        var id;
        
        $("#keywordBtn").on("click", function() {
            $.ajax({
               url: "/movie/movieread",
               type:"POST",
               data: {"keyword":$("#input_keyword").val()},
               dataType: "json",
               success: function (data) {
                  if(data){
                     $(".movieList").html("");
                     
                     for(var i = 0; i < data.length; i++){
                     /*    console.log(data[i].mimg); */
                    
                     /* 영화 코드 가져오기.  */
                        $(".movieList")
                          .append("<span data-index=" + i + "   id='" + data[i].mtitle + "'>" + data[i].mtitle + "</span><br>")
                          .on("click" ,"#" + data[i].mtitle, function() {
                               $(".movieImg").html("<img data-poster='poster' id="+data[$(this).attr("data-index")].mcode+" width='650' height='300' src='/resources/images/movieimg/"+data[$(this).attr("data-index")].mimg+"'>" )
                               .on("click" ,function(){
                                  id = $("img[data-poster]").attr("id");
                                  console.dir(id);
                               }) ;
                         });
                       }
                  }
               }
            });
         });
        
        
     <!-- 업로드 -->
     var dateArr = [];
     var fileNameArr = [];
     
     $(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			console.log(files);
			console.log(files.length);
			for(var i=0 ; i < files.length; i++){
			var formData = new FormData();
			
			
			formData.append("file", files[i]);
			$.ajax({
				url: '/movie/uploadAjax',
				data: formData,
				dataType: 'text',
				processData: false,
				contentType: false,
				type: 'POST',
				success: function(data){
					  var str ="";
					  var date = data.substring(0, data.indexOf("s"));
					  var fileName = data.substring(data.indexOf("s") + 2);
					  
					  dateArr.push(date);
					  fileNameArr.push(fileName);
					  
					  //console.log(date);
					  //console.log(fileName);
					  //console.log(data);
					  //console.log(checkImageType(data));
					  totalPath.push(checkImageType(data));
					  if(checkImageType(data)){
						  str ="<span>" +"<img style= 'margin :5px' src='displayFile?fileName="+data+"'/>"+"<small data-src="+data+">X</small></span>";
					  }else{
						  str = "<sapn>"+data+"<small data-src="+data+">X</small></sapn>";
					  }
					  
					  $(".uploadedList").append(str);
					  
				}
			});
			}
		});
		function checkImageType(fileName){
			
			var pattern = /jpg|gif|png|jpeg/i;
			
			return fileName.match(pattern);
			
		}
		
		$(".uploadedList").on("click", "small", function(event){
			
			 //var date = data.substring(0, data.indexOf("s"));
			 //var fileName = data.substring(data.indexOf("s") + 2);
			 var that = $(this);
			 var date = $(this).attr("data-src").substring(0, $(this).attr("data-src").indexOf("s"));
			 var fileName = $(this).attr("data-src").substring($(this).attr("data-src").indexOf("s") + 2);
			 //console.log(date);
			 //console.log(fileName);
			for(var i = 0; i < dateArr.length; i++) {
				 if(dateArr[i] == date){
					 dateArr.splice(i, 1);
					 fileNameArr.splice(i, 1);
				 }
			 } 
		
		   $.ajax({
			   url:"/movie/deleteFile",
			   type:"post",
			   data: {fileName:$(this).attr("data-src")},
			   dataType:"text",
			   success:function(result){
				   //console.log(result);
				   //console.log(date);
				   if(result == 'deleted'){
					   
					   that.parent("span").remove();
				   }
			   }
		   });
	});
    </script>
  </body>
</html>
