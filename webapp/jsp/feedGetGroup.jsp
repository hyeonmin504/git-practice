<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="DAO.*"%>
<%
	String frids = request.getParameter("frids");
	String maxNo = request.getParameter("maxNo");
	out.print((new FeedDAO()).getGroup(frids, maxNo));
%>