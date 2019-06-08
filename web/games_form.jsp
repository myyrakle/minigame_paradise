<%--
  Created by IntelliJ IDEA.
  User: selab
  Date: 2019-06-08
  Time: 오전 1:56
  To change this template use File | Settings | File Templates.
--%>
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
                            <li><a href="index.jsp">Home</a></li>
                            <li class="active"><a href="games_form.jsp">게임 목록</a></li>
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
                <br/><br/><br/><br/><br/><br/><br/>
                <div class="jumbotron">
                    <img src="image/tetris.png" width="100"/>
                    <h2 class="text-muted">테트리스</h2>
                    <p class="text-info">위에서 내려오는 블럭들을 모양이 맞게 맞춰서, <br/>
                        줄이 꽉 찬다면 포인트를 얻는 게임입니다.<br/>
                        회전: Space. 이동: 방향키.
                    </p>
                    <p>
                        <a class="btn btn-lg btn-primary" href="tetris.jsp" role="button">하러가기 &raquo;</a>
                    </p>
                </div>

                <div class="jumbotron">
                    <img src="image/tetris.png" width="100"/>
                    <h2 class="text-muted">??</h2>
                    <p class="text-info">...하는 게임입니다.</p>
                    <p>
                        <a class="btn btn-lg btn-primary" href="" role="button">하러가기 &raquo;</a>
                    </p>
                </div>
            </div>


        </div>
    </div>
</div>
</body>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</html>
