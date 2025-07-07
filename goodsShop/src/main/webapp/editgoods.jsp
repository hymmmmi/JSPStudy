<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<!--부트스트랩 연결-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- css 연결-->
<link href="css/styles.css" rel="stylesheet" />

<title>▶ 수원 블루윙즈 Goods shop ◀</title>
<h1> 상품 수정</h1>

<!-- 상품 삭제 확인  -->
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다") == true)
			location.href = "./deletegoods.jsp?id="+id;
		 else 
			return;
	}
</script>

</head>

<%
	String edit = request.getParameter("edit");
%>

<body>
	<div class="container py-4">
		<%@ include file="menu.jsp"%>


   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품 수정</h1>
        <p class="col-md-8 fs-4">Goods Editing</p>      
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
       		<div class="h-100 p-2 round-3">		
       		    <img src="./images/<%=rs.getString("i_fileName")%>" style="width: 250; height:350" />	
				<p><h5><b><%=rs.getString("i_name")%></b></h5>
				<p> <%=rs.getString("i_description").substring(0,60)%>....
				<p><%=rs.getString("i_category")%>				
				<p><%=rs.getString("i_unitPrice")%>원
				<p><%
						if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("i_id")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
					<%
						}
					%>	
			</div>	
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