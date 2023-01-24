<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*"%>
<%@ page import="DAO.*"%>
<%
	String str = (new FeedDAO()).getList();
	out.print(str);
%>