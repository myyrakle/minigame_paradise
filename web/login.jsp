<%--
  로그인 처리 화면입니다.
  뷰는 없습니다.
--%>

<%@ page
    contentType="text/html;charset=UTF-8"
    language="java"
    import = "classes.LoginBean"
%>

<jsp:useBean id="loginer" class="classes.LoginBean" scope="page"/>
<jsp:setProperty name="loginer" property="*"/>

<script>
<%
    /*LoginBean loginer = new LoginBean();
    loginer.setUsername(request.getParameter("username"));
    loginer.setPassword(request.getParameter("password"));*/

    try {
        if (loginer.check()) {
            session.setAttribute("username", loginer.getUsername());
            response.sendRedirect("index.jsp");
        } else
            out.println("alert('사용자명이나 비밀번호가 틀립니다.'); window.location.href='login_form.jsp';");
    }
    catch(Exception e) {
        e.printStackTrace();
    }
%>
</script>