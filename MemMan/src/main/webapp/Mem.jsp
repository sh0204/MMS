<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width" initial-scale="1" >
<title>회원관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="loginstyle.css">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<style>
    .bs-example{
    	margin: 20px;
    }
</style>
</head>

<body>
	<%
	if (session.getAttribute("userID") == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	%>
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
        </ul>
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
    </div>
</nav>

	<div style="text-align: center;">
	<form align="center" method="post" action="search.jsp" >
        <input type="text" name="name" color=#a0a5b1 placeholder ="Search By Name">
        <button type="submit" class="btn btn-light btn-sm" "><i class="bi-search"></i></button><br><br>
    </form>
    </div>
    
    
    
<div class="bs-example">
    <div class="table-responsive"> 
        <table class="table">
            <thead>
                <tr>
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
            </thead>
            <tbody>
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
            </tbody>
        </table>
    </div>    
</div>
</body>
</html>