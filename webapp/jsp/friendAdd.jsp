<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="DAO.*"%>
<%
String uid = request.getParameter("id");
String frid = request.getParameter("frid");
out.print((new FriendDAO()).insert(uid, frid));
%>