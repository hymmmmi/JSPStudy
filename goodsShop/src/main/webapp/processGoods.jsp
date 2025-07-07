<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="dto.goodsDTO"%>
<%@page import="dao.goodsDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	String filename = "";
	String realFolder=application.getRealPath("./images");
	
	int maxSize = 5*1024*1024;
	String encType = "utf-8";
	
	MultipartRequest multipartRequest = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String id = multipartRequest.getParameter("id");
	String name = multipartRequest.getParameter("name");
	String unitPrice = multipartRequest.getParameter("unitPrice");
	String description = multipartRequest.getParameter("description");	
	String size = multipartRequest.getParameter("size");
	String category = multipartRequest.getParameter("category");
	String unitsInStock = multipartRequest.getParameter("unitsInStock");
	String goodsImage = multipartRequest.getParameter("fileName"); // post로 전달받은 값
	
	Enumeration files = multipartRequest.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multipartRequest.getFilesystemName(fname);

	
	int price;

	if (unitPrice == null || unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice); 
	// 가격이 문자타입으로 전달됨, 정수타입으로 변경 

	long stock;

	if (unitsInStock == null || unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	// 재고가 문자타입으로 전달됨, long 타입으로 변경
	
	
	goodsDAO dao = goodsDAO.getInstance();

	goodsDTO newItems = new goodsDTO(); // 빈객체 생성
	newItems.setI_id(id); // 위 전달된 값을 객체에 넣음
	newItems.setI_name(name);
	newItems.setI_unitPrice(price);
	newItems.setI_description(description);
	newItems.setI_category(category);
	newItems.setI_unitInStock(stock);
	newItems.setI_size(size);
	newItems.setI_filename(goodsImage);

	
	System.out.print(newItems.toString());
	dao.addGoods(newItems); // 만들어진 객체를 리스트배열에 꼽는다.
	
	response.sendRedirect("goods.jsp"); // 성공시 강제로 이동하는 페이지


%>
</html>