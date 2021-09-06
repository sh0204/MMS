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
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			System.out.println("userUpdate.jsp : userID"+userID);
		}else if (session.getAttribute("userID") == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
		User user = new UserDAO().getUser(userID);
		if (!userID.equals(user.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
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
        
    </div>
    
</nav>
<div class="modal-dialog modal-login">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Change</h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        </div>
        <div class="modal-body">
            <form action="userUpdateAction.jsp" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="ID" name="userID" value="<%=user.getUserID()%>" readonly>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" name="userPassword" value="<%=user.getUserPassword()%>">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="User Name " name="userName" value="<%=user.getUserName()%>">
                </div>
                <div class="form-group">
                    <input type="date" class="form-control" placeholder="Birth" name="userBirth" value="<%=user.getUserBirth()%>">
                </div>
                <div class="form-group">
                    <input type="tel" class="form-control" placeholder="Tel" name="userNum" value="<%=user.getUserNum()%>">
                </div>
                
                <div class="form-group">
                    <input type="submit" class="btn btn-primary form-control" value="UPDATE">
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>