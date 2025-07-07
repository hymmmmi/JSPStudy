<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<!--부트스트랩연결-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- css 연결-->
<link href="css/styles.css" rel="stylesheet" />
<title>▶ 수원 블루윙즈 Goods shop ◀</title>
</head>
<body>
	<div class="container py-4">
	
		<%@ include file="menu.jsp"%>
		

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
			<h1 class="display-5 fw-bold"><fmt:message key = "title"/></h1>
				<h1 class="display-5 fw-bold">상품 등록</h1>
			</div>
			
			<div class="row align-items-md-stretch">
				</div>
			<form name = "newItems" action="./processGoods.jsp" method="post" encType="multipart/form-data">
				
				<div class="mb-3 row">
					<label class="col-sm-2">상품코드</label>
					<div class = "col-sm-3">
						<input type = "text" id="id" name="id" class="form-control">
					</div>
				</div>
			
				
				<div class="mb-3 row">
					<label class="col-sm-2">상품명</label>
					<div class = "col-sm-3">
						<input type = "text" id="name" name="name" class="form-control">
					</div>
				</div>
			
				
				<div class="mb-3 row">
					<label class="col-sm-2">상품 가격</label>
					<div class = "col-sm-3">
						<input type = "text" id="unitPrice" name="unitPrice" class="form-control">
					</div>
				</div>
			
				
				<div class="mb-3 row">
					<label class="col-sm-2">상품 설명</label>
					<div class = "col-sm-5">
						<textarea name="description" id="description" cols="50" rows="2"
							class="form-control" placeholder="10자 이상 적어주세요"></textarea>
					</div>
				</div>
			
				
				<div class="mb-3 row">
					<label class="col-sm-2">상품 사이즈</label>
					<div class = "col-sm-3">
						<input type = "text" id="size" name="size" class="form-control">
					</div>
				</div>
			
				
				<div class="mb-3 row">
					<label class="col-sm-2">분류</label>
					<div class="col-sm-5">
						<input type="radio" name="category" value="Home "> 홈그라운드 <input
							type="radio" name="category" value="Aways"> 원정 <input
							type="radio" name="category" value="Acc"> 악세사리
					</div>
			
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">재고 수</label>
					<div class = "col-sm-3">
						<input type = "text" id="stock" name="stock" class="form-control">
					</div>
				</div>
			
				
				<div class="mb-3 row">
					<label class="col-sm-2">이미지</label>
					<div class = "col-sm-5">
						<input type = "file" id="goodsImage" name="goodsImage" class="form-control">
					</div>
				</div>
				<div class = "mb-3 row">
					<div class = "col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="등록" onclick="CheckAddGoods()">
					</div>
				</div>
			
			</form>

		
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>