<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@page import="java.util.*"%>
<%@ page import="util.*" %>
<%@ page import="DAO.*" %>
<%
	String str = (new UserDAO()).getList();
/*
		String str = "<table align=center border=0>";
	str += "<tr><th colspan=3>가입자 리스트</th></tr>";
	for(UserObj user : users) {
		str += "<tr><td colspan=3><hr></td></tr>";
		str += "<tr>";
		str += "<td>" + user.getId() + "&nbsp;</td>";
		str += "<td>" + user.getName() + "&nbsp;</td>";
		str += "<td>&nbsp;<small>(" + user.getTs() + ")</small></td>";
		str += "</tr>";
	}
	str += "</table>";
	*/
	out.print(str);
%>