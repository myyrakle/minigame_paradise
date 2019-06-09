<%@ page
    contentType="text/html;charset=UTF-8"
    language="java"
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link href="./css/cover.css" rel="stylesheet">
        <title>미니게임 극락</title>
    </head>

    <body>

    <div class="site-wrapper">
        <div class="site-wrapper-inner">
            <div class="cover-container">
                <div class="masthead clearfix">
                    <div class="inner">
                        <h3 class="masthead-brand">미니게임 극락</h3>
                        <nav>
                            <ul class="nav masthead-nav">
                                <li class="active"><a href="index.jsp">Home</a></li>
                                <li><a href="games_form.jsp">게임 목록</a></li>
                                <%=
                                    session.getAttribute("username")==null?
                                        "<li><a id=\"login\" href=\"login_form.jsp\">로그인</a></li>" :
                                        "<li><a id=\"login\" href=\"logout.jsp\">로그아웃</a></li>"
                                %>
                            </ul>
                        </nav>
                    </div>
                </div>

                <div class="inner cover">
                    <h1 class="cover-heading">어서오세요!</h1>
                    <p class="lead">이곳은 테트리스 같은 간단하면서 재미있는 게임들을 플레이하고,<br/>
                        점수를 등록해서 다른 유저들과 경쟁을 할 수 있는 극락입니다!</p>
                    <p class="lead">
                        <%=
                            session.getAttribute("username")==null?
                                "<a href=\"signup_form.jsp\" class=\"btn btn-lg btn-default\">회원가입 하러가기</a>":
                                "<a href=\"games_form.jsp\" class=\"btn btn-lg btn-default\">게임 하러가기</a>"
                        %>

                    </p>
                </div>
            </div>
        </div>
    </div>
    </body>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</html>