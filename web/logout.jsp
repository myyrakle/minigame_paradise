<%--
  Created by IntelliJ IDEA.
  User: selab
  Date: 2019-06-08
  Time: 오전 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    session.removeAttribute("username");
    response.sendRedirect("index.jsp");
%>