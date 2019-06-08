<%--
랭킹을 모여줍니다.
--%>
<%@ page
        contentType="text/html;charset=UTF-8"
        language="java"
        import="classes.RankBean"
%>

<%
    String gamename = request.getParameter("gamename");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/ranking.css">
        <link href="./css/cover.css" rel="stylesheet">
        <title>미니게임 극락 랭킹</title>
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
                        <h2><%=gamename.equals("tetris")?"테트리스":""%> 랭킹</h2><br/>
                        <table id="rank" border="1">
                            <tr align="center">
                                <td>순위</td> <td>이름</td> <td>점수</td>
                            </tr>
                            <%=RankBean.getAllTable(gamename)%>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
</html>