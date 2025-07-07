<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<title>▶ 수원 블루윙즈 Goods shop ◀</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	
   
   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품목록</h1>
        <p class="col-md-8 fs-4">GoodsList</p>      
      </div>
    </div>
	 <%@ include file="dbconn.jsp" %>
	 
	 <div class="row align-items-md-stretch   text-center">	 	
	 <%
	    PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from items";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
	  %>
     	<div class="col-md-4">
       		<div class="h-100 p-2">	
       			<img src="./images/<%=rs.getString("i_fileName")%>" style="width: 250; height:350" />		
				<h5><b><%=rs.getString("i_name")%></b></h5>
				<p> <%=rs.getString("i_description")%>....
				<p><%=rs.getString("i_unitPrice")%>원
				<p><a href="./goodsdetail.jsp?id=<%=rs.getString("i_id")%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>	</div>	
		</div>			
		<%
			}
		if (rs != null) 
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		%>	
		</div>	
		<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>