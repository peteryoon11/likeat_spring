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

<style type="text/css">
.formValidation {
	color: red;
	font-size: 12px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {

	// 이름 길이 체크
    $("#username").on("keyup focus", function() {
	    var username = $("#username").val();
	    var regexp = /^[가-힣a-zA-Z]+$/;
	    if(username.length >= 2 && username.length <= 4 && regexp.test(username)) {
	        $("#usernameCheck").text("");
	    } else {
	        $("#usernameCheck").text("한글 또는 영문 2 ~ 4자로 입력해주세요");
	    }
    });
	
	
	// 아이디 중복 체크
	var idResult = '사용중인 아이디 입니다';	// submit 클릭시 확인하기 위한 var	
	$("#userid").on("keyup", function() {
		var useridcheck = $("#userid").val();
         $.ajax({
            type:"post",
            url:"idDuplicationCheck/" + useridcheck,
            dataType:"text", 
            success:function(responseData, status, xhr) {
            	console.log("id duplicatio check ==> " + responseData);
            	idResult = responseData;
            	$("#useridCheck").text(responseData);
            },
            error:function(error) {
                console.log("실패이유 : " + error);
            }
        });//ajax 
	});
	
	
	// 아이디 체크
    $("#userid").on("keyup focusin focusout", function() {
	    var userid = $("#userid").val();
	    var regex = /^.*(?=.{5,9})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	    console.log('userid.trim.length ==> ' + userid.trim().length);
	    console.log('!regex.test(userid) ==> ' + !regex.test(userid));
	    if(userid.trim().length == 0 || !regex.test(userid) || userid.length > 9) {
	        $("#useridCheck").text("아이디 형식을 확인해주세요(영문 + 숫자 혼합하여 5 ~ 9자)");
	    } else {
	        $("#useridCheck").text("");
	    }
    });

	
	
	// 비밀번호 클릭시 내용 삭제
/* 	$("#userpw, #userpwReCheck").on("focus", function() {
		$(this).parent().next().text("");	
		if($(this).val().trim().length != 0) {
			$(this).val("");
		}
	}); */
	
	
	// 비밀번호 체크
     $("#userpw, #userpwReCheck").on("focusin", function() {
        $("#userpw, #userpwReCheck").on("focusout", function() {
            var pw = $("#userpw").val();
            var pwRe = $("#userpwReCheck").val();
            var regex = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
            if(pw.trim().length == 0 || !regex.test(pw)) {
                $("#userpwCheck").text("영문 + 숫자 6자리 이상 입력해주세요");
            } else if (pw.length > 20) {
                $("#userpwCheck").text("20자리 이하로 입력해주세요");
            } else if (pwRe.trim().length == 0) {
            	$("#userpwReCheckCheck").text("비밀번호를 확인해주세요");
            } else {
                $("#userpwCheck").text("");
            }
        });
    });
	

	// 비밀번호 일치 확인
    $("#userpw, #userpwReCheck").on("keyup", function() {
        if($(this).val().trim().length != 0) {
            if($("#userpw").val() != $("#userpwReCheck").val()) {
                $("#userpwReCheckCheck").text("비밀번호를 확인해주세요");
            } else {
                $("#userpwReCheckCheck").text("");
            }
        } else {
        	$(this).parent().next().text("비밀번호를 입력해주세요");
        }
    });
	
	
	// 이메일 형식 체크
    $("#email").on("focusin", function() {
        $("#email").on("focusout", function() {
            var email = $("#email").val();
            var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            if(email.trim().length == 0 || !regExp.test(email)) {
                $("#emailCheck").text("이메일을 확인해주세요");
            } else {
                $("#emailCheck").text("");
            }
        });
    });

	
	
	// 전화번호 형식 체크 (이벤트 여러개 등록하여, 빈값이거나 길이 체크)
    $(".phone").on("keyup focusin", function() {
            var regExp = /^[0-9]+$/;
        	$(".phone").each(function(idx, obj) {
        		var phone = $(obj).val();
	            if(phone.trim().length == 0 || phone.trim().length < 3 || !regExp.test(phone)) {
	                $("#phoneCheck").text("전화번호를 확인해주세요");
	            } else {
	                $("#phoneCheck").text("");
	            }
        	});
    });
	
	
	
	$("#submit").on("click", function(event) {
		var result = false;
		if(idResult.trim().length == 0 &&
				$("#usernameCheck, #useridCheck, #userpwCheck, #userpwReCheckCheck, #emailCheck, #phoneCheck").text().trim().length == 0 &&
				$("#username, #userid, #userpw, #userpwReCheck, #email, #phone2, #phone3").val().trim().length != 0) {
			result = true;
		}
		return result;
	});
	
});//ready
</script>		
<body>
	<div class="container">
		<div class="row main">
			<div class="panel-heading">
               <div class="panel-title text-center">
               		<h1 class="title">JOIN LIKEat!</h1>
               		<hr />
               	</div>
            </div> 
			<div class="main-login main-center">
				<form id="joinForm" class="form-horizontal" method="post" action="JoinController">
					<div class="form-group">
					  <label class="col-md-5 control-label" for="username">이름</label>  
					  <div class="col-md-2">
					  	<input id="username" name="username" type="text" class="form-control input-md" placeholder="한글 또는 영문 2 ~ 4자">
					  </div>
					  <span class="formValidation" id="usernameCheck"></span>
					</div>
					
					<div class="form-group">
					  <label class="col-md-5 control-label" for="userid">아이디</label>  
					  <div class="col-md-2">
					  	<input id="userid" name="userid" type="text" class="form-control input-md" placeholder="영문 + 숫자 5 ~ 9자">
					  </div>
					  <span class="formValidation" id="useridCheck"></span>
					</div>
					
					<div class="form-group">
					  <label class="col-md-5 control-label" for="userpw">비밀번호</label>
					  <div class="col-md-2">
					    <input id="userpw" name="userpw" type="password" class="form-control input-md" placeholder="영문 + 숫자 6자리 이상">
					  </div>
					  <span class="formValidation" id="userpwCheck"></span>
					</div>
					
					<div class="form-group">
					  <label class="col-md-5 control-label" for="userpwCheck">비밀번호 확인</label>
					  <div class="col-md-2">
					    <input id="userpwReCheck" name="userpwCheck" type="password" class="form-control input-md">
					  </div>
					  <span class="formValidation" id="userpwReCheckCheck"></span>
					</div>


					<div class="form-group">
					  <label class="col-md-5 control-label" for="email">Email</label>  
					  <div class="col-md-4">
					  	<input id="email" name="email" type="text" placeholder="LIKEat@LIKEat.com" class="form-control"/>
						<span class="formValidation" id="emailCheck"></span>
					  </div>
					</div>
					
					<div class="form-group">
						<label class="col-md-5 control-label" for="phone">전화번호</label>  
						<div class="col-md-6">
							<div class="form-inline">
								<select name="phone1" id="phone1" class="form-control col-xs-1 phone">
									<option value="010" selected="selected">010</option>
									<option value="011">011</option>
									<option value="017">017</option>
									<option value="02">02</option>
								</select>
								 &nbsp;-&nbsp;<input id="phone2" name="phone2" type="text" class="form-control input-md phone" size="8" maxlength="4">
								-&nbsp;<input id="phone3" name="phone3" type="text" class="form-control input-md phone" size="8" maxlength="4">
							</div>
						<span class="formValidation" id="phoneCheck"></span>
						</div>
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
