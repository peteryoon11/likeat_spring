<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Custom CSS Source -->
<link rel="stylesheet" href="css/topfix1_1.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="row fixed-menu">
		<!-- ���� ���κ� -->
		<div class="col-sm-2">�ΰ� �� ��� ���� �� �κ� 2</div>
		<div class="col-sm-6">
			<button type="button" class="btn btn-info">
				<span class="glyphicon glyphicon-search"></span> Search
			</button>
			<div class="form-group">
				<input type="email" class="form-control" width="200" id="search"
					placeholder="ã�� ������ �Է��ϼ���">
			</div>
			�˻�â�� ���� �κ� 6
		</div>
		
		<div class="col-sm-4">
			����� �޴� ���� �κ� 4

			<div class="btn-group">
				<button type="button" class="btn btn-primary">����</button>
				<button type="button" class="btn btn-primary">��������Ʈ</button>
				<button type="button" class="btn btn-primary">��������Ʈ</button>

				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">
						Sony <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Tablet</a></li>
						<li><a href="#">Smartphone</a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>
<c:forEach begin="0" end="10">
	<div class="row main-content">
		<!-- �߰� ���� �ִ� �κ� -->
		<div class="col-sm-3">
			<img class="img-responsive"
				src="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/9388_1484709367248107.jpg">
		</div>
		<div class="col-sm-3">
			<img class="img-responsive"
				src="TestSource/Detailtest/dummy_image/dummy_02.jpg">
		</div>
		<div class="col-sm-3">
			<img class="img-responsive"
				src="TestSource/Detailtest/dummy_image/dummy_03.jpg">
		</div>
		<div class="col-sm-3">
			<img class="img-responsive"
				src="TestSource/Detailtest/dummy_image/dummy_04.jpg">
		</div>
	</div>
	</c:forEach>
</body>
</html>