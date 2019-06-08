<%--
  회원가입 처리화면입니다.
  뷰는 없습니다.
--%>
<%@ page
    contentType="text/html;charset=UTF-8"
    language="java"
    import ="classes.SignupBean"
%>

<script>
<%
    if(request.getParameter("password").equals(request.getParameter("paassword_check")));
    else
        out.println("alert('비밀번호와 비밀번호 확인란의 값이 일치하지 않습니다.'); window.location.href='signup_form.jsp';");

    SignupBean signer = new SignupBean();
    signer.setUsername(request.getParameter("username"));
    signer.setPassword(request.getParameter("password"));

    if(signer.check()) //중복 아님
    {
        signer.register();
        response.sendRedirect("index.jsp");
    }
    else
        out.println("alert('가입 불가능한 사용자명입니다.'); window.location.href='signup_form.jsp';");
%>
</script>