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
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700|Open+Sans" rel="stylesheet">

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
                    aria-expanded="false" >CONNECT</a>
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
                     	<li><a href="userUpdate.jsp">UPDATE</a></li>
                        <li><a href="logoutAction.jsp">LOGOUT</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>
    </div>
</nav>
<div class="container">
	<div class="row">
		<div class="col-md-8 col-center">
			<h2>회원관리 프로그램</h2>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Carousel indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
				
				</ol>   
				<!-- Wrapper for carousel items -->
				<div class="carousel-inner">
					<div class="item active">
						<div class="img-box"><img src="images/profile1.jpg" alt=""></div>
						<p class="testimonial">
						<div style="text-align:center">
						간단한 회원관리 JSP 웹 사이트 입니다.<br>
						디자인 템플릿으로 부트스트랩을 사용하였으며, 개발 환경은 Eclipse입니다.<br>
						주요 기능으로는 로그인/로그아웃, 회원가입 및 추가, 회원목록 조회 및 검색이 있습니다.
						</div>
						</p>
						<p class="overview"><b>JUNG SO HEE</b>, CUK CSIE 19</p>
					</div>
					<div class="item">
						<div class="img-box"><img src="images/profile2.jpg" alt=""></div>
						<p class="testimonial">
						<div style="text-align:center">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
  						<path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
						</svg> <a href="https://github.com/sh0204" style="color: #a177ff">CLICK ME</a><br><br>
						전체 코드는 이곳에서 볼 수 있습니다
						</div>
						</p>
						<p class="overview"><b>JUNG SO HEE</b>, CUK CSIE 19</p>
					</div>
					
				</div>
			    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
	            </a>
	            <a class="right carousel-control" href="#myCarousel" data-slide="next">
	                <span class="glyphicon glyphicon-chevron-right"></span>
	            </a>
			</div>
		</div>
	</div>
</div>

</body>
</html>