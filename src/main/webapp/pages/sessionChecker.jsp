<%@ page language="java" contentType="text/html; charset-UTF-8" %>
<%
    if(session.getAttribute("userFullName")==null){
        request.getRequestDispatcher("/login").forward(request,response);
    }
%>