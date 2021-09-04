<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width" initial-scale="1" >
    <title>회원관리</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="loginstyle.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID")!=null){
			userID = (String)session.getAttribute("userID");
		}
	
	%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="navbar-header"> <!-- 홈페이지의 로고 -->
                <a class ="navbar-brand" href="main.jsp">회원관리 프로그램</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

        <ul class="navbar-nav me-auto">
            <li class="active">
                <a class="nav-link" href="main.jsp">HOME</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Mem.jsp">조회</a>
            </li>
        </ul>
        <%

                if(userID == null)
                {
         %>
         <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">CONNECT</a>
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">LOGIN</a></li>
                        <li><a href="join.jsp">SIGN UP</a></li>                    
                    </ul>
                </li>
            </ul>
            <%
            // 로그인이 되어있는 사람만 볼수 있는 화면
                } else {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">STATUS</a>
                    <ul class="dropdown-menu">
                        <li><a href="logoutAction.jsp">LOGOUT</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>
    </div>
</nav>



</body>
</html>