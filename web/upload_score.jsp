<%@ page
    contentType="text/html;charset=UTF-8"
    language="java"
    import="classes.RankBean"
%>

<%
    RankBean.setScore(request.getParameter("gamename"),
            request.getParameter("username"),
            Integer.parseInt(request.getParameter("score")));

    response.sendRedirect(request.getParameter("gamename")+".jsp");
%>