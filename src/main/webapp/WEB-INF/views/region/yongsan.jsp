<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Bootstrap Core CSS -->
<link
	href="resources/bootstrap/startbootstrap-4-col-portfolio-gh-pages/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="resources/bootstrap/startbootstrap-4-col-portfolio-gh-pages/css/4-col-portfolio.css"
	rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
 <![endif]-->
<style type="text/css">

.thumbnail-wrap {
  width: 100%;
}

.thumbnail-wrap img {
  display: block;
  max-width: 100%;
  height: auto;
}

.thumbnail {
  position: relative;
  padding-top: 100%;
  overflow: hidden;
}

.thumbnail img {
  position: absolute;
  top:0;
  left: 0;
}

.thumbnail .centered  {
  position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
  -webkit-transform: translate(50%,50%);
    -ms-transform: translate(50%,50%);
    transform: translate(50%,50%);
}

.thumbnail .centered img {
  -webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
}

.thumbnail img.portrait {
  width: 100%;
  max-width: none;
  height: auto;
}

.thumbnail img.landscape {
  width: auto;
  max-width: none;
  height: 100%;
}


.thumbnail-wrapw {
  width: 100%;
  height: 50%;
}

.thumbnail-wrapw imgw {
  display: block;
  max-width: 100%;
   height: 50%;
}

.thumbnailw {
  position: relative;
  padding-top: 100%;
  overflow: hidden;
}

.thumbnailw imgw {
  position: absolute;
  top:0;
  left: 0;
}

.thumbnailw .centeredw  {
  position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}

.thumbnailw img.landscapew {
   width: 100%;
  max-width: none;
  height: 50%; 
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
    var curPage = 2;

    var lastScrollTop = 0;
    var easeEffect = 'easeInQuint';
     
    // 1. 스크롤 이벤트 발생
    $(window).scroll(function(){ // ① 스크롤 이벤트 최초 발생
         
        var currentScrollTop = $(window).scrollTop();
		var addPage = '';
		var addInnerPage = '';
        if( currentScrollTop - lastScrollTop > 0 ){
             
            if ($(window).scrollTop() == ($(document).height() - $(window).height()) ){ //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
                // 3. 현재 뿌려진 게시글의 curPage정보를 받아와, 다음페이지 분량의 list를 받아온다
                // 4. ajax를 이용하여 다음페이지의 게시물 데이터를 받아온다.
                $.ajax({
                	type : 'get', 
                    url : 'infiniteScrollList/yongsan/'+curPage,// 요청할 서버의 url
                    success : function(pageDTO){
                        if(pageDTO != ""){
                            // 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
                            console.log("성공!! ============> ");
                            $.each(pageDTO.list, function (idx, s) {
								<c:choose>
			                		<c:when test='${0 eq s.ratingCnt}'>
										addInnerPage += '<div class="col-lg-3 col-sm-6">'
														+	'<a href=' + s.imgSrc1 + ' class="portfolio-box">'
	        					        				+		'<img src=' + s.imgSrc1 + ' class="img-responsive" alt="" >'
	        					        				+		'<div class="portfolio-box-caption">'
	        					            			+			'<div class="portfolio-box-caption-content">'
	        					                		+				'<div class="project-name">'
	        					                    	+ 					s.sname
	        					                		+ 				'</div>'
	        					                		+				'<div class="project-category text-faded">'
														+ 					'아직 별점이 없습니다'							
	        					                		+ 				'</div>'
	        					            			+			'</div>'
	        					            			+		"</div>"
	        					            			+	"</a>"
	        					            			+"</div>";
									</c:when>
								<c:otherwise>
		                                addInnerPage += '<div class="col-lg-3 col-sm-6">'
			        					   				+	'<a href=' + s.imgSrc1 + ' class="portfolio-box">'
			        					        		+		'<img src=' + s.imgSrc1 + ' class="img-responsive" alt="" >'
			        					        		+		'<div class="portfolio-box-caption">'
			        					            	+			'<div class="portfolio-box-caption-content">'
			        					                +				'<div class="project-name">'
			        					                + 					s.sname
			        					                + 				"</div>"
			        					                +				'<div class="project-category text-faded">'
			        					                + 					(s.rating / s.ratingCnt).toFixed(1)
			        					                + 				'</div>'
			        					            	+			'</div>'
			        					            	+		"</div>"
			        					            	+	"</a>"
			        					            	+"</div>";
								</c:otherwise>
							</c:choose>	                            	
                            });
								addPage = "<section class='no-padding neweatList' id='portfolio'>"
											+ 	"<div class='container'>"
											+ 		"<div class='row no-gutter popup-gallery'>"
								            + 			addInnerPage 
								            + 			"<input type='hidden' id='curPage' name='curPage' value=" + pageDTO.curPage + "'>"
								 			+ 		"</div>"
								 			+ 	"</div>"
											+ "</section>";
							console.log(addInnerPage);
                            $(".neweatList").last().after(addPage);
                            console.log("현재페이지 ===============> " + curPage);
                            curPage++;
                        } else{ 
                            alert("더 불러올 데이터가 없습니다.");
                        }// else
                    },// success
                    error:function(request,status,error){
                        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                });// ajax
                var position = $(".project-name").last().offset();// 위치 값
                $('html,body').stop().animate({scrollTop : position.top }, 600, easeEffect);
            }//if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
        }// 다운스크롤인 상태
	});// scroll event

});
</script>
<body id="mainPage">
	<!-- TOPeat! -->
	<div class="container" style="padding-top: 50px">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-4">
				<h1 class="page-header" style="color: orange; font-style: italic; font-weight: bold;">용산구 TOPeat!</h1>
			</div>
		</div>
		<!-- /.row -->
		<!-- Projects Row -->
		<div class="container">
			<div class="col-md-12">
			  	<div class="col-md-3">
			  		<a href="DetailPageController?sid=${topList[0].sid}" class="portfolio-box">
						<div class="thumbnail-wrap">
							<div class="thumbnail" style="overflow: hidden">
								<div class="centered">
									<img src="${topList[0].imgSrc1}" class="landscape" style="max-width:100%;">
								</div>
							</div>
						</div>
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-name">
								${topList[0].sname}
							</div>
							<div class="project-category text-faded">
								<c:choose>
									<c:when test="${0 eq topList[0].ratingCnt}">
										"아직 별점이 없습니다"							
									</c:when>
									<c:otherwise>
										<c:set value="${topList[0].rating / topList[0].ratingCnt}" var="rate"/>
		 								<fmt:formatNumber value="${rate }" pattern=".0"/>
									</c:otherwise>
								</c:choose>
								${topList[0].sid}
	          	 			</div>
		           		</div>
	       			</div>
					</a>
				</div>
			</div> <!-- end : col-md-12 -->
		</div> <!-- end : content container -->
	</div>
	<!-- TOPeat! container -->



	<!-- NEWeat! container -->
	<div class="container newContainer" style="padding-top: 50px">
		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-4">
				<h1 class="page-header" style="color: orange; font-style: italic; font-weight: bold;">용산구 NEWeat!</h1>
			</div>
		</div>
		<!-- /.row -->
		<!-- Projects Row -->
		<div class="container">
			<div class="col-md-12">
			  	<div class="col-md-3">
			  		<a href="DetailPageController?sid=${newList[0].sid}" class="portfolio-box">
						<div class="thumbnail-wrap">
							<div class="thumbnail" style="overflow: hidden">
								<div class="centered">
									<img src="${newList[0].imgSrc1}" class="landscape" style="max-width:100%;">
								</div>
							</div>
						</div>
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-name">
								${newList[0].sname}
							</div>
							<div class="project-category text-faded">
								<c:choose>
									<c:when test="${0 eq newList[0].ratingCnt}">
										"아직 별점이 없습니다"							
									</c:when>
									<c:otherwise>
										<c:set value="${newList[0].rating / newList[0].ratingCnt}" var="rate"/>
		 								<fmt:formatNumber value="${rate }" pattern=".0"/>
									</c:otherwise>
								</c:choose>
								${newList[0].sid}
	          	 			</div>
		           		</div>
	       			</div>
					</a>
				</div>
			</div> <!-- end : col-md-12 -->
		</div> <!-- end : content container -->
	<!-- </div> -->
	<!-- NEWeat! container -->


<!-- 	<div class="container"> -->
		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header" style="color: orange; font-style: italic; font-weight: bold;">
					용산구 LIKEat! <small>all the list</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- NEWeat! container -->
    <section class="no-padding neweatList" id="portfolio">
        <div class="container">
            <div class="row popup-gallery">
				<c:forEach items="${pageDTO.list}" var="s" varStatus="i">
					<div class="col-lg-3 col-sm-6">
					    <a href="${s.imgSrc1}" class="portfolio-box">
					        <img src="${s.imgSrc1}" class="img-responsive" alt="" >
					        <div class="portfolio-box-caption">
					            <div class="portfolio-box-caption-content">
					                <div class="project-name">
					                    ${s.sname}
					                </div>
					                <div class="project-category text-faded">
					                    ${s.sid}
					                    <input type="hidden" id="curPage" name="curPage"  value="${pageDTO.curPage}">
					                </div>
					            </div>
					        </div>
					    </a>
					</div>
            	</c:forEach>
            </div>
        </div>
    </section>
  <div id="inputData"></div>
    <br/>


<!-- Footer -->
	<footer class="container-fluid text-center">
		<a href="#mainPage" title="맨 위로">
			<span class="glyphicon glyphicon-chevron-up" style="color: orange;"></span>
		</a>
		<br/><br/>
		<p>Copyright &copy; LIKEat Project 2017</p>
<!-- <p>Bootstrap Theme Made By <a href="https://www.w3schools.com" title="Visit w3schools">www.w3schools.com</a></p> -->
	</footer>

 
</body>