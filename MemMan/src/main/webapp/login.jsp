<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width" initial-scale="1" >
    <title>회원관리</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="loginstyle.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="navbar-header"> <!-- 홈페이지의 로고 -->
                <a class ="navbar-brand" href="main.jsp">회원관리 프로그램</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

        <ul class="navbar-nav me-auto">
            <li class="nav-item">
                <a class="nav-link" href="main.jsp">HOME</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Mem.jsp">조회</a>
            </li>
        </ul>
       
    </div>
</nav>
<!-- Modal HTML -->
<div class="modal-dialog modal-login">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">LOGIN</h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><a href="main.jsp">×</button></a>
        </div>
        <div class="modal-body">
            <form action="loginAction.jsp" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="ID" name="userID">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" name="userPassword">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary btn-block btn-lg" value="OK">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>