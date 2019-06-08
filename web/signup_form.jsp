<%--
 회원가입 화면입니다.
--%>
<%@ page
    contentType="text/html;charset=UTF-8"
    language="java"
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <title>회원가입</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- Custom styles for this template -->
        <link href="./css/login_form.css" rel="stylesheet">
    </head>

    <body>
        <div class="container">
            <form class="form-signin" method="POST" action="">
                <h2 class="form-signin-heading">사용자명과 비밀번호를 등록해주세요</h2>

                <label for="username" class="sr-only">사용자명</label>
                <input type="username" name="username" id="username" class="form-control" placeholder="사용자명" required="" autofocus="">

                <label for="password" class="sr-only">비밀번호</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호" required="">

                <label for="password_check" class="sr-only">비밀번호 확인</label>
                <input type="password" name="password_check" id="password_check" class="form-control" placeholder="비밀번호 확인" required="">

                <button class="btn btn-lg btn-primary btn-block" type="submit">가입</button>
            </form>
        </div>
    </body>
</html>
