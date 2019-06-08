<%--
  테트리스 게임화면입니다.
--%>
<%@ page
    contentType="text/html;charset=UTF-8"
    language="java"
    import="classes.RankBean"
%>

<!DOCTYPE html>
<!-- saved from url=(0037)http://bootstrapk.com/examples/cover/ -->
<html lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <title>극락 테트리스</title>

    <!-- Custom styles for this template -->
    <link href="./css/cover.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tetris_form.css"/>

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
                        <br/><br/><br/><br/><br/><br/><br/>
                        <div id = "div_all" align="center">
                            <canvas id="gamebox" width="300" height="600"></canvas>

                            <span id = "side_area" align="left">
                                <button id="playbutton" onclick="playButtonClicked();">Play</button>
                                <button id="stopbutton" onclick="stopButtonClicked();" disabled>Stop</button>
                                <br/>
                                <button id="score_box" disabled>점수: 0</button>
                                <br>
                                <span align="center">
                                    <table id="rank" border="1">
                                        <tr align="center"><td colspan="3">랭킹</td></tr>
                                        <tr align="center">
                                            <td>순위</td> <td>점수</td> <td>이름</td>
                                        </tr>
                                        <%=RankBean.getTop10Table("tetris")%>
                                    </table>
                                    <button id="more_rank" onclick="window.location.href='ranking.jsp?gamename=tetris'">더 보기</button>
                                </span>
                                <form id="upload_form" name="upload_form" method="post" action="upload_score.jsp">
                                    <input id="gamename" name="gamename" type="hidden" value="tetris"/>
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
    <script src='js/tetris/tetris.js'></script>
    <script src='js/tetris/render.js'></script>
    <script src='js/tetris/control.js'></script>

</html>