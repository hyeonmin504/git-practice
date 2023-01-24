<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="DAO.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	
	
	FeedDAO dao = new FeedDAO();
	
	if(dao.exists(id)==false){
		out.print("<hmtl><h3 align=center>게시물을 찾을 수 없습니다..</h3></hmtl>");
		return;
	}
	
	if (dao.delete(id)) {
		response.sendRedirect("main.jsp");
	}
	else {
		out.print("<hmtl><h3 align=center>게시물 삭제 중 오류가 발생하였습니다.</h3></hmtl>");
	} 
%>