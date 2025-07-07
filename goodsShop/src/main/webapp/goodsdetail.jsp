<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.goodsDTO"%>
<%@ page import="dao.goodsDAO"%>
<%@ page import="java.sql.*"%>

<html>
<!--부트스트랩 연결-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- css 연결-->
<link href="css/styles.css" rel="stylesheet" />

<title>▶ 수원 블루윙즈 Goods shop ◀</title>

<!-- 상품주문 입력시 장바구니 추가 경고  -->
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>

</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp"%>

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
				<h1 class="display-5 fw-bold">상품 정보</h1>
				<p class="col-md-8 fs-4">GoodsInfo</p>
			</div>
		</div>
		<%@ include file="dbconn.jsp"%>
		<%
		String goodsId = request.getParameter("id");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from items where i_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goodsId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
		%>
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img src="./images/<%=rs.getString("i_fileName")%>"
					style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3>
					<b><%=rs.getString("i_name")%></b>
				</h3>
				<p><%=rs.getString("i_description")%>%>
				<p>
					<b>상품코드 : </b><span class="badge text-bg-danger"> <%=rs.getString("i_id")%></span>
				<p>
					<b>가격</b> :
					<%=rs.getString("i_unitPrice")%> 원
				<p>
					<b>상품설명</b> :
					<%=rs.getString("i_description")%>
				<p>
					<b>상품사이즈</b> :
					<select name = "size" class = "form-select" style="width: 200px; display: inline-block;">
					<% 
						String sizes = rs.getString("i_size");
						String[] sizeArray = sizes.split(",");
						for(String size : sizeArray) {
					%>
					
						<option value = "<%=size.trim() %>"><%=size.trim() %></option>
							
					<%
						}
					%>
					</select>
					
				<p>
					<b>분류</b> :
					<%=rs.getString("i_category")%>
				<p>
					<b>재고수</b> :
					<%=rs.getString("i_unitsInStock")%>
					<h4><%=rs.getString("i_unitPrice")%>원
				</h4>
				<p>
				<form name="addForm" action="./addCart.jsp?id=<%=rs.getString("i_id")%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 상품주문&raquo;</a>
					<a href="./orderCart.jsp" class="btn btn-warning"> 장바구니&raquo;</a>
					<a href="./goods.jsp" class="btn btn-secondary"> 상품목록&raquo;</a>
				</form>
			</div>
		</div>
		<%
		} // IF문 종료
		%>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>