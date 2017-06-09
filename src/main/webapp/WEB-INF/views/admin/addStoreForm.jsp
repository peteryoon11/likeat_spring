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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {

	
	
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
					  <div class="col-md-2">
					  	<input id="sname" name="sname" type="text" class="form-control input-md">
					  </div>
					  <span class="formValidation" id="snameCheck"></span>
					</div>
					
					<div class="form-group">
						<label class="col-md-5 control-label" for="hour">영업시간</label>  
						<div class="col-md-7">
							<div class="form-inline">
								<select name="hour11" id="hour11" class="form-control col-xs-1 hour">
									<c:forEach begin="01" end="24" var="hour11">
										<option value="${hour11}">${hour11}</option>
									</c:forEach>
								</select>
								 : 
								<input id="hour12" name="hour12" type="text" class="form-control input-md hour" size="2" maxlength="2"/>
								&nbsp;~&nbsp;
								<select name="hour21" id="hour21" class="form-control col-xs-1 hour">
									<c:forEach begin="01" end="24" var="hour21">
										<option value="${hour21}">${hour21}</option>
									</c:forEach>
								</select>
								: <input id="hour22" name="hour22" type="text" class="form-control input-md hour" size="2" maxlength="2"/>
							</div>
						<span class="formValidation" id="hourCheck"></span>
						</div>
					</div>

					
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
						<input name="addr2" id="addr2" size="40" placeholder="지번주소">



					  </div>
					  <span class="formValidation" id="addrCheck"></span>
					</div>
					
					
					
					<!-- Button -->
					<div class="form-group">
					  <label class="col-md-5 control-label" for="submit"></label>
					  <div class="col-md-4">
					  	<input type="reset" id="clearForm" name="clearForm" class="btn btn-primary" style="background-color: orange; border: none;" value="다시 작성하기"/>
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
