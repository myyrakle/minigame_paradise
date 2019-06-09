<%--
  벽돌깨기 게임화면입니다.
--%>
<%@ page
        contentType="text/html;charset=UTF-8"
        language="java"
        import="classes.RankBean"
%>

<!DOCTYPE html>
<!-- saved from url=(0037)http://bootstrapk.com/examples/cover/ -->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/breakout_form.css"/>
        <title>극락 벽돌깨기</title>

        <!-- Custom styles for this template -->
        <link href="./css/cover.css" rel="stylesheet">

    </head>
    <body>
        <audio id="clearsound" src="./sound/pop.ogg" preload="auto"></audio>

        <div class="site-wrapper">
            <div class="site-wrapper-inner">
                <div class="cover-container">
                    <div class="masthead clearfix">
                        <div class="inner">
                            <h3 class="masthead-brand">미니게임 극락</h3>
                            <nav>
                                <ul class="nav masthead-nav">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li><a href="games_form.jsp">게임 목록</a></li>
                                    <li><a id="login" href="logout.jsp">로그아웃</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    <div class="inner cover">
                        <br/><br/><br/>
                        <div id = "div_all" align="center">
                            <canvas id="canvas" width="480" height="320"></canvas>

                            <span id = "side_area" align="left">
                                <button id="playbutton" onclick="onPlayButtonClicked();">Play</button>
                                <button id="stopbutton" onclick="onStopButtonClicked();" disabled>Stop</button>
                                <br/>
                                <button id="score_box" disabled>점수: 0</button>
                                <br>
                                <span align="center">
                                    <table id="rank" border="1">
                                        <tr align="center"><td colspan="3">랭킹</td></tr>
                                        <tr align="center">
                                            <td>순위</td> <td>점수</td> <td>이름</td>
                                        </tr>
                                        <%=RankBean.getTop10Table("breakout")%>
                                    </table>
                                    <button id="more_rank" onclick="window.location.href='ranking.jsp?gamename=breakout'">더 보기</button>
                                </span>
                                <form id="upload_form" name="upload_form" method="post" action="upload_score.jsp">
                                    <input id="gamename" name="gamename" type="hidden" value="breakout"/>
                                    <input id="username" name="username" type="hidden" value="<%=session.getAttribute("username")%>"/>
                                    <input id="score" name="score" type="hidden" value="0"/>
                                </form>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <script src='http://code.jquery.com/jquery-1.10.2.js'></script>
    <script>
        //로그인 세션 체크
        let on_login = true;
        <%
            if(session.getAttribute("username")==null) //로그인 안됨
                out.println("on_login=false;");
        %>

        if(!on_login)
        {
            alert('로그인이 필요합니다.');
            window.location.href='index.jsp';
        }
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="js/breakout/breakout_.js"></script>
    <script src="./js/breakout/user_control.js"></script>

</html>