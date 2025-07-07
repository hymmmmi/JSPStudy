<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%
	String goodsId = request.getParameter("id"); 

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	Connection conn = null;
	
	String sql = "select * from items";
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		sql = "delete from items where i_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goodsId);
		pstmt.executeUpdate();
		
	}else 
		out.println("등록된 상품이 없습니다.");
	
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	
	response.sendRedirect("editgoods.jsp?edit=delete");
	
%>