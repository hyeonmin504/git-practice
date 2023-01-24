<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@ page import="util.*"%>
<%@ page import="DAO.*"%>
<%
String uid = request.getParameter("id");
out.print((new UserDAO()).get(uid));
%>