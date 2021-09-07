<%@ page import = "java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="user.*" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>회원관리 프로그램</title>
</head>
<body>
	<%
	String userID = null;
	User user = new User();
	if(session.getAttribute("userID")!=null);{
	user.setUserID((String)session.getAttribute("userID"));
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	} 
	String userName = null;
	if (request.getParameter("userName") != null) {
		
		user.setUserName(request.getParameter("userName"));
	}
	if (request.getParameter("userPassword") != null) {
		
		user.setUserPassword(request.getParameter("userPassword"));
	}
	if (request.getParameter("userBirth") != null) {
		
		user.setUserBirth(request.getParameter("userBirth"));
	}
	if (request.getParameter("userNum") != null) {
		
		user.setUserNum(request.getParameter("userNum"));
	}
	
	
	if (!userID.equals(user.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("</script>");
	}else{
		if(request.getParameter("userPassword") == null || request.getParameter("userName") == null || request.getParameter("userBirth") == null || request.getParameter("userNum") == null
				||request.getParameter("userPassword").equals("") || request.getParameter("userName").equals("")||request.getParameter("userBirth").equals("") || request.getParameter("userNum").equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.modify(user);
			
			System.out.println("update for result int : " + result);
			if (result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");	
			}
			else{
				System.out.println("update user href");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	}
	%>	
</body>
</html>
