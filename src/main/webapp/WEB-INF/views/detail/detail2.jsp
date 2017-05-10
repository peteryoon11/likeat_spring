<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

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
<title>LikeEat Detail Page Proto</title>
<style type="text/css">
/* <div>
					<span class="glyphicon glyphicon-eye-open"></span> 
					<input type="hidden" value="���">
					 :00 
					<span class="glyphicon glyphicon-pencil"></span>
					<input type="hidden" value="����">
					:00 
					<span class="glyphicon glyphicon-star"></span>
					<input type="hidden" value="���ϱ�"> :00
					</div> */
.glyphicon-eye-open ,
.glyphicon-pencil ,.glyphicon-star
 {
	font-size: 20px;
	color:orange;
}

.glyphicon-star-empty, #starLikeat
{
	font-size: 40px;
	color:orange;
}
/*
.glyphicon-pencil
{
	font-size: 20px;
	color:orange;
}

.glyphicon-star
{
	font-size: 20px;
	color:orange;
}
 */
</style>
</head>
${storeOne}
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
	
	<div class="row">
		<!-- �߰� ���� �ִ� �κ� -->
		<div class="col-sm-3">
			<img class="img-responsive" src="${Rdata.imgSrc1}">
		</div>
		<div class="col-sm-3">
			<img class="img-responsive" src="${Rdata.imgSrc2}">
		</div>
		<div class="col-sm-3">
			<img class="img-responsive" src="${Rdata.imgSrc3}">
		</div>
		<div class="col-sm-3">
			<img class="img-responsive" src="${Rdata.imgSrc4}">
		</div>
	</div>
	<div class="row">
		<!-- �Ʒ� ������ ������  -->
		<div class="col-sm-8">
			.col-sm-4 ������ �������

			<div class="row">
				<div class="col-sm-8">
					<p>${Rdata.sname}���� 4.0</p>
					<div>
						<span class="glyphicon glyphicon-eye-open"></span> <input
							type="hidden" value="���"> :00 <span
							class="glyphicon glyphicon-pencil"></span> <input type="hidden"
							value="����"> :00 <span class="glyphicon glyphicon-star"></span>
						<input type="hidden" value="���ϱ�"> :00
					</div>

				</div>
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-star-empty " id="starLikeat"></span> ��
					�ڸ�

				</div>

			</div>
			<hr>
			<div>�޹��� ���γ� �Ĵ翡 ���� �Ұ�</div>

			<hr>
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-4">

					<!-- 	�����ִ� �÷��� ����ŭ �־� �� ������ ����� dummy ����
				 -->
					<div>�ּ�: ${Rdata.addr1}&nbsp; ${Rdata.addr2}</div>
					<div>�����ð�:</div>
					<div>�ּ�:</div>
					<div>�ּ�:</div>
					<div>�ּ�:</div>
					<div>�ּ�:</div>

				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-sm-7">~~ �Ĵ��� ���� ����(00)</div>
				<div class="col-sm-5">

					<!-- ��ü (33) ���ִ� (20) ������ (10) ���� (2)
					 -->
					<ul class="breadcrumb">
						<li><a href="#">��ü(33)</a></li>
						<li><a href="#">���ִ�(20)</a></li>
						<li><a href="#">������(10)</a></li>
						<li class="active">����(2)</li>
					</ul>

				</div>
			</div>
			<!-- ������ ���ö� �ش�Ǵ� ��������� ������� �ҷ��ͼ� foreach ������ ������ŭ �ҷ�����
			���Ŀ� ���ѽ�ũ�� jquery �̿��ؼ� ���Ͽ���
			 -->
			<hr>
			<div>
				<div class="row">
					<div class="col-sm-2">
						<div>�۾��� ������ ����</div>
						<div>�۾����� �̸�</div>
						<div>�۾����� ���� ����</div>
					</div>
					<div class="col-sm-8">
						<div>���� ��¥ 2017-03-20</div>
						���� ���� ���� �Ʒ����� ���� �߰� ����
						<div>���� ���� �� ���� ����</div>
					</div>

					<div class="col-sm-2">���� �̹����� ���� ����</div>
				</div>

			</div>
		</div>

		<div class="col-sm-4">
			.col-sm-4
			<div>
				���� �ڸ� <img class="img-responsive"
					src="TestSource/Detailtest/dummy_image/dummy_map.png">
			</div>
			<div>
				�ֺ� ���� ����!!
				<!-- 
				������� ������ �޾ƿ� �� ��ġ ���� �޾ƿͼ� �ݰ� 500m ���ܷ� 
				���� ������ ������� �̶��� �������� ����  -->
				<div class="row">
					<div class="col-sm-3">������ ����</div>
					<div class="col-sm-3">������ ����</div>
					<div class="col-sm-6"></div>

				</div>
				<div>������ ����!</div>

			</div>
		</div>
	</div>
	<footer>
	<div class="row">
		<!-- �Ʒ� ������ ������  -->
		<div class="col-sm-12">
			bottom �κ� copyright
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li><a href="#">Private</a></li>
				<li><a href="#">Pictures</a></li>
				<li class="active">Vacation</li>
			</ul>

		</div>

	</div>
	<div>${Rdata}</div>
	<br>
	<hr>
	<div>${storeOne}</div>
	</footer>
</body>
</html>