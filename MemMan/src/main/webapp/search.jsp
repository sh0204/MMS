<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="user.*" %>
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
    request.setCharacterEncoding("utf-8");
    String name_1 = request.getParameter("name");
    User memberVO = new User();
    memberVO.setUserName(name_1);
    MemberDAO dao = new MemberDAO();
    ArrayList membersList = dao.listmembers(memberVO);
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="navbar-header"> <!-- 홈페이지의 로고 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class ="navbar-brand" href="main.jsp">회원관리 프로그램</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

        <ul class="navbar-nav me-auto">
            <li class="nav-item">
                <a class="nav-link" href="main.jsp">HOME</a>
            </li>
            <li class="active">
                <a class="nav-link" href="Mem.jsp">조회</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logoutAction.jsp">로그아웃</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="join.jsp">회원가입</a>
            </li>
        </ul>
    </div>
</nav>
	<table border=1 style="width:800px;align:center">
    <tr style="background-color:#E4CEF2; text-align:center;">
        <th style="text-align:center;">아이디</th>
        <th style="text-align:center;">비밀번호</th>
        <th style="text-align:center;">이름</th>
        <th style="text-align:center;">생년월일</th>
        <th style="text-align:center;">전화번호</th>
    </tr>
    <%
    	for(int i=0; i<membersList.size(); i++){
       	 	User vo = (User) membersList.get(i);
        	String userID  =vo.getUserID();
        	String userPassword = vo.getUserPassword();
       		String userName = vo.getUserName();
        	String userBirth = vo.getUserBirth();
        	String userNum  = vo.getUserNum();
    %>
    
    <tr align="center">
        <td><%= userID %></td>
        <td><%= userPassword %></td>
        <td><%= userName %></td>
        <td><%= userBirth %></td>
        <td><%= userNum %></td>
    </tr>
  	<%    
        }
    %>
</table>
	
</body>
</html>