<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header2.jsp" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Detail.jsp</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/amuse/slick/slick.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/amuse/slick/slick.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/amuse/slick/slick-theme.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>

<!-- 부트스트랩 cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- 폰트 설정 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet&display=swap" rel="stylesheet">
<!-- 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<style>
.div{
	height: 450px;
}
#img-list{
	overflow: hidden;
}
.imgs{margin-left: 10px;}

.rImg{
	height: 250px;
}

.main-img{
	width: 100%;
	height: 500px;
}
</style>

<script>
$.noConflict();

$(function(){
    $('.slider-div').slick({
        slide: 'div',        //슬라이드 되어야 할 태그 ex) div, li 
        infinite : true,     //무한 반복 옵션     
        slidesToShow : 4,        // 한 화면에 보여질 컨텐츠 개수
        slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
        speed : 1000,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
        arrows : true,         // 옆으로 이동하는 화살표 표시 여부
        dots : false,         // 스크롤바 아래 점으로 페이지네이션 여부
        autoplay : true,            // 자동 스크롤 사용 여부
        autoplaySpeed : 2000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
        pauseOnHover : true,        // 슬라이드 이동 시 마우스 호버하면 슬라이더 멈추게 설정
        vertical : false,        // 세로 방향 슬라이드 옵션
        draggable : true,     //드래그 가능 여부 
    });
    
    
    $(".tab_title li").click(function(){
        const idx = $(this).index();
        console.log(idx)
        $(".tab_title li").removeClass("on");
        $(".tab_title li").eq(idx).addClass("on");

        $(".tab_content > div").removeClass("on")
        $(".tab_content > div").eq(idx).addClass("on")
    })
  })
  
function viewBtn(rId){
	//alert("click")
	$.ajax({
		url: "/ridesDetailAjax?rides_id=" + rId,
		type: "get",
		dataType: "json",
		success: function(response){
			$(".ajaxDiv").html("");
			
			console.log(response["r_img"])
			
			let data = "";
			data += "<div class=" + "'col-md-6'>"
			data += "<img class=" + "'main-img card-img-top mb-5 mb-md-0 bg-gray tem card shadow-sm' src=" + response["r_img"] + "/>"
			data += "</div>"
			data += "<div class=" + "'col-md-6'>"
			data += "<div class=" + "'d-flex small text-warning mb-2'>"
			data += "<div class=" + "'bi-star-fill></div>"
			data += "<div class=" + "'bi-star-fill></div>"
			data += "<div class=" + "'bi-star-fill></div>"
			data += "<div class=" + "'bi-star-fill></div></div>"
			data += "<h3 class=" + "'fw-bolder'>" + response["r_name"] + "</h3>"
			data += "<div class=" + "'fs-5 mb-5'>"
			data += "<div>" + response["r_info"] + "</div><br>"
			data += "<span class=" + "'fw-bolder'> 위치: " + "</span><span>" + response["r_location"] + "</span><br>"
			data += "<span class=" + "'fw-bolder'> 키: </span><span> 키: " + response["r_min_height"] + " 이상 " + response["r_max_height"] + " 이하</span></div>"
			data += "<div class=" + "'d-flex'>"
			data += "<button class=" + "'btn imgs btn-outline-dark flex-shrink-0' type=" + "'button'>Like</button>"
			data += "<button class=" + "'btn imgs btn-outline-dark flex-shrink-0' type=" + "'button' onclick=" + 'history.back();' + ">List</button>"
			data += "</div></div>"

			console.log("data = " + data)
			
			$(".ajaxDiv").html(data);
		},
		error:function(request,status,error){
			console.log("code: " + request.status)
			console.log("message: " + request.responseText)
			console.log("error: " + error);
		}
	})
	
	window.scrollTo({ left: 0, top: 0, behavior: "smooth" });
}

function viewAmuseBtn(n){
	location.href = "/amuseDetail?amuse_id=" + n;
}
</script>

</head>
<body>
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-lg-5 align-items-center ajaxDiv">
				<div class="col-md-6">
					<input type="hidden" id="r_img" value="${dto.r_img }">
					<img class="card-img-top mb-5 mb-md-0 bg-gray tem card shadow-sm main-img" src="${dto.r_img }"/>
				</div>
				<div class="col-md-6">
					<div class="d-flex small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<h3 class="fw-bolder">${dto.r_name }</h3>
					<div class="fs-5 mb-5">
						<div>
						${dto.r_info }
						</div><br>
						<span class="fw-bolder">위치: </span><span>${dto.r_location }</span><br>
						<c:choose>
							<c:when test="${dto.r_max_height eq null}">
								<span class="fw-bolder">키: </span><span>${dto.r_min_height } 이상</span>
							</c:when>
							<c:otherwise>
								<span class="fw-bolder">키: </span><span>키: ${dto.r_min_height } 이상 ${dto.r_max_height } 이하</span>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="d-flex">
						<button class="btn imgs btn-outline-dark flex-shrink-0" type="button" onclick="#">
							Like
						</button>
						<button class="btn imgs btn-outline-dark flex-shrink-0" type="button" onclick="history.back();">
							List
						</button>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</section>
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 my-5">
			<h3 class="fw-bolder">탑승 영상</h3>
			<div style="position: relative; z-index: 1; width: 100%; height: 100%">
				<iframe width="100%" height="500" src="${dto.r_video }" 
				title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</div>
			<hr>
		</div>
	</section>
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">놀이기구 추천</h2>
			<div class="d-flex slider-div" id="img-list">
				<c:forEach items="${list }" var="list">
					<div class="col mb-5 div">
						<div class="card h-100 imgs">
							<img class="card-img-top rImg" src="${list.r_img }"/>
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${list.r_name }</h5>
								</div>
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<button type="button" class="btn btn-outline-dark mt-auto"
									onclick="viewBtn(${list.rides_id });">View options</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">국내 놀이공원 추천</h2>
			<div class="d-flex slider-div" id="img-list">
				<c:forEach items="${inList }" var="list">
					<div class="col mb-5 div">
						<div class="card h-100 imgs">
							<img class="card-img-top rImg" src="${list.a_img }"/>
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${list.a_name }</h5>
								</div>
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<button type="button" class="btn btn-outline-dark mt-auto"
									onclick="viewAmuseBtn(${list.amuse_id });">View options</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">해외 놀이공원 추천</h2>
			<div class="d-flex slider-div" id="img-list">
				<c:forEach items="${outList }" var="list">
					<div class="col mb-5 div">
						<div class="card h-100 imgs">
							<img class="card-img-top rImg" src="${list.a_img }"/>
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${list.a_name }</h5>
								</div>
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<button type="button" class="btn btn-outline-dark mt-auto"
									onclick="viewAmuseBtn(${list.amuse_id });">View options</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

</body>
</html>
