<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%request.setCharacterEncoding("UTF-8"); %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

Website CSS style
<link rel="stylesheet" type="text/css" href="assets/css/main.css"> -->

<!-- Website Font style -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

<!-- Bootstrap Core CSS -->
<link href="resources/bootstrap/startbootstrap-4-col-portfolio-gh-pages/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resources/bootstrap/startbootstrap-4-col-portfolio-gh-pages/css/4-col-portfolio.css" rel="stylesheet">

<!-- DAUM 주소 라이브러리-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="resources/js/daum.js"></script>

<style type="text/css">
.formValidation {
	color: red;
	font-size: 12px;
}

label.scategory, label.parking {
	font-weight: lighter;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {

/* 	function resetCheck(t, e) {
	    e.preventDefault();
	    if(!confirm("입력 정보를 삭제하시겠습니까?")) {
	        return;
	    } else {
	        return true;
	    }
	} */
	
	
});//ready
</script>		
<body>
	<div class="container">
		<div class="row main">
			<div class="panel-heading">
               <div class="panel-title text-center">
               		<h1 class="title">Add LIKEat!</h1>
               		<hr />
               	</div>
            </div> 
			<div class="main-login main-center">
				<form id="addForm" class="form-horizontal" method="post" action="AddStore">
					<div class="form-group">
					  <label class="col-md-5 control-label" for="sname">이름</label>  
					  <div class="col-md-4">
					  	<input id="sname" name="sname" type="text" class="form-control input-md">
					  </div>
					  <span class="formValidation" id="snameCheck"></span>
					</div>
					
					<hr/>
					
					<div class="form-group">
						<label class="col-md-5 control-label" for="shour1">영업시간</label>  
						<div class="col-md-7">
							<div class="form-inline">
<%-- 								<select name="hour11" id="hour11" class="form-control col-xs-1 hour">
									<c:forEach begin="01" end="24" var="hour11">
										<option value="${hour11}">${hour11}</option>
									</c:forEach>
								</select> --%>
								<input id="shour1"  name="shour1" type="text" class="form-control input-md hour" size="4" maxlength="4" placeholder="1030"/>
								 ~ 
								<input id="shour2" name="shour2" type="text" class="form-control input-md hour" size="4" maxlength="4" placeholder="2200"/>
							</div>
						<span class="formValidation" id="hourCheck"></span>
						</div>
					</div>

					<hr/>
					
					<div class="form-group">
					  <label class="col-md-5 control-label" for="sname">주소</label>  
					  <div class="col-md-2">
						<input name="post1" id="post1" size="3" readonly="" > -
						<input name="post2" id="post2" size="3" readonly="">
						<input onclick="openDaumPostcode()" type="button" value="우편번호찾기">
						<br>
						<span id="" style="width: 1px; height: 1px; float: right;">
							<embed width="1"
									height="1" id=""
									src="http://sgroom.tistory.com/plugin/CallBack_bootstrapperSrc?nil_profile=tistory&nil_type=copied_post"
									type="application/x-shockwave-flash" swliveconnect="true"
									flashvars="&callbackId=sgroomtistorycom739114&host=http://sgroom.tistory.com&embedCodeSrc=http%3A%2F%2Fsgroom.tistory.com%2Fplugin%2FCallBack_bootstrapper%3F%26src%3D%2F%2Fs1.daumcdn.net%2Fcfs.tistory%2Fresource%2F3771%2Fblog%2Fplugins%2FCallBack%2Fcallback%26id%3D73%26callbackId%3Dsgroomtistorycom739114%26destDocId%3Dcallbacknestsgroomtistorycom739114%26host%3Dhttp%3A%2F%2Fsgroom.tistory.com%26float%3Dleft"
									enablecontextmenu="false" wmode="transparent"
									allowscriptaccess="always"/>
						</span>
						<span style="line-height: 10%;"><br></span>
						<input name="addr1" id="addr1" size="40" readonly="" placeholder="도로명주소">
						<br>
						<span style="line-height: 10%;"><br></span>
						<input name="addr2" id="addr2" size="40" placeholder="지번주소" >


					  </div>
					  <span class="formValidation" id="addrCheck"></span>
					</div>
					
					
					<hr/>
					
					
					<div class="form-group">
					  <label class="col-md-5 control-label" for="sname">분류</label>  
					  <div class="col-md-6">
					  	<label class="control-label scategory" for="scategoryKor">한식</label> 
					    <input id="scategoryKor" name="scategory" type="radio" value="한식"/> &nbsp;&nbsp;|&nbsp;&nbsp;
					  	<label class="control-label scategory" for="scategoryFor">양식</label> 
					    <input id="scategoryFor" name="scategory" type="radio" value="양식"/> &nbsp;&nbsp;|&nbsp;&nbsp;
					  	<label class="control-label scategory" for="scategoryChi">중식</label> 
					    <input id="scategoryChi" name="scategory" type="radio" value="중식"/> &nbsp;&nbsp;|&nbsp;&nbsp;
					  	<label class="control-label scategory" for="scategoryJap">일식</label> 
					    <input id="scategoryJap" name="scategory" type="radio" value="일식"/> &nbsp;&nbsp;|&nbsp;&nbsp;
					  	<label class="control-label scategory" for="scategorySna">분식</label> 
					    <input id="scategorySna" name="scategory" type="radio" value="분식"/>
					  </div>
					  <span class="formValidation" id="scategoryCheck"></span>
					</div>
					
					<hr/>
					
					
					<div class="form-group">
						<label class="col-md-5 control-label" for="sphone1">전화번호</label>  
						<div class="col-md-6">
							<div class="form-inline">
								<input id="sphone1" name="sphone1" type="text" class="form-control input-md phone" size="3" maxlength="3">
								 &nbsp;-&nbsp;<input id="sphone2" name="sphone2" type="text" class="form-control input-md phone" size="8" maxlength="4">
								-&nbsp;<input id="sphone3" name="sphone3" type="text" class="form-control input-md phone" size="8" maxlength="4">
							</div>
						<span class="formValidation" id="phoneCheck"></span>
						</div>
					</div>


					<hr/>

					<div class="form-group">
					  <label class="col-md-5 control-label" for="menu">대표메뉴</label>  
					  <div class="col-md-4">
					  	<input id="menu" name="menu" type="text" class="form-control input-md" placeholder="햄버거, 피자, 된장찌개">
					  </div>
					  <span class="formValidation" id="menuCheck"></span>
					</div>
					
					<hr/>


					<div class="form-group">
					  <label class="col-md-5 control-label" for="sprice">가격대</label>  
					  <div class="col-md-4">
					  	<input id="sprice" name="sprice" type="text" class="form-control input-md" placeholder="15000 (평균 가격대를 입력해주세요)">
					  </div>
					  <span class="formValidation" id="spriceCheck"></span>
					</div>
					
					<hr/>



					<div class="form-group">
					  <label class="col-md-5 control-label" for="parking">주차여부</label>  
					  <div class="col-md-6">
					  	<label class="control-label parking" for="parkingY">가능</label> 
					    <input id="parkingY" name="parking" type="radio" value="y"/> &nbsp;&nbsp;|&nbsp;&nbsp;
					  	<label class="control-label parking" for="parkingN">불가능</label> 
					    <input id="parkingN" name="parking" type="radio" value="n"/>
					  </div>
					  <span class="formValidation" id="scategoryCheck"></span>
					</div>
					
					<hr/>
					
					
					<div class="form-group">
					  <label class="col-md-5 control-label" for="imgSrc1">이미지1</label>  
					  <div class="col-md-4">
					  	<input id="imgSrc1" name="imgSrc1" type="text" class="form-control input-md" placeholder="(필수) 이미지 url 입력">
					  </div>
					  <span class="formValidation" id="imgSrc1Check"></span>
					  
					  <label class="col-md-5 control-label" for="imgSrc2">이미지2</label>  
					  <div class="col-md-4">
					  	<input id="imgSrc2" name="imgSrc2" type="text" class="form-control input-md" placeholder="이미지 url 입력">
					  </div>
					  <span class="formValidation" id="imgSrc2Check"></span>
					  
					  <label class="col-md-5 control-label" for="imgSrc3">이미지3</label>  
					  <div class="col-md-4">
					  	<input id="imgSrc3" name="imgSrc3" type="text" class="form-control input-md" placeholder="이미지 url 입력">
					  </div>
					  <span class="formValidation" id="imgSrc3Check"></span>
					  
					  <label class="col-md-5 control-label" for="imgSrc4">이미지4</label>  
					  <div class="col-md-4">
					  	<input id="imgSrc4" name="imgSrc4" type="text" class="form-control input-md" placeholder="이미지 url 입력">
					  </div>
					  <span class="formValidation" id="imgSrc4Check"></span>
					</div>

					<br/>
					
					<!-- Button -->
					<div class="form-group">
					  <label class="col-md-5 control-label" for="submit"></label>
					  <div class="col-md-4">
					  	<input type="reset" id="clearForm" name="clearForm" class="btn btn-primary" style="background-color: orange; border: none;" value="다시 작성하기" onclick="resetCheck(this, event)"/>
					    <input type="submit" id="submit" name="submit" class="btn btn-primary" style="background-color: white; border-color: orange; color: orange; font-weight: bold;" value="LIKEat NOW!"/>
					  </div>
					</div>
				</form>
			</div>
		</div>
	</div>

<!-- 	<script type="text/javascript" src="assets/js/bootstrap.js"></script> -->
	<!-- Bootstrap Core JavaScript -->
	<script src="resources/bootstrap/startbootstrap-4-col-portfolio-gh-pages/js/bootstrap.min.js"></script>
</body>