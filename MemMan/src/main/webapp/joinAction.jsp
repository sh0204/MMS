<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userBirth" /> 
<jsp:setProperty name="user" property="userNum" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>회원관리 프로그램</title>

</head>
<body>
<%
	String userID =null;
	if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("<location.href = 'main.jsp'");
		script.println("</script>");
	}
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ||user.getUserBirth() == null || user.getUserNum() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('빈칸이 존재합니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href= 'main.jsp'");
			script.println("</script>");
			}
		}

%>

</body>
</html>