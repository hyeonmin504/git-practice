<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="DAO.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("id");
	//String upass = request.getParameter("ps");
	//String usite = request.getParameter("site");
	//String uname = request.getParameter("name");
	String jsonstr = request.getParameter("jsonstr");

	UserDAO dao = new UserDAO();
	if (dao.exists(uid)) {
		out.print("EX");
		return;
	}
	if(dao.insert(uid, jsonstr) == true) {
		session.setAttribute("id",uid);
		out.print("OK");
	}
	else{
		out.print("ER");
		//<hmtl><h3 align=center>회원 가입 중 오류가 발생하였습니다.</h3></hmtl>
	}
%>