<%@page import="jsp.encrypt.sha256.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="jsp.member.vo.MemberVo"
	import="jsp.member.service.MemberService"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="../CSS/stylesheet.css" rel="stylesheet">
<title>로그인</title>
</head>

<style>
a {
	background: rgb(98, 196, 235);
	color: black;
	border: 2px solid black;
	text-decoration: none;
	padding: 5px;
	border: 2px solid white;
	transition-duration: 500ms;
}

a:hover {
	background: rgb(163, 227, 252);
	border: 2px solid skyblue;
	transition-duration: 500ms;
}
</style>

<body>
	<div class="wrapper">
		<%
			MemberVo mv = new MemberVo();
			MemberVo mvResult = new MemberVo();
			String userId = request.getParameter("userId");
			String userPwd = new SHA256().enctyptSHA256(request.getParameter("userPwd"));
					
			mv.setUserId(userId);
			mv.setUserPwd(userPwd);

			mvResult = new MemberService().memberLogin(mv);
			session.setAttribute("user", mvResult);

			if (mvResult == null) {
		%>
		<h1>로그인 실패</h1>
		<br>
		<hr id="line-1-hr-index">
		<br>
		<fieldset id="fset-loginsuccess">
			<h3>
				<%="회원정보를 찾을 수 없습니다"%>
			</h3>
		</fieldset>
		<br> <a href="login.html">로그인 페이지로</a>
		<%
			} else {
		%>
		<h1>로그인 완료</h1>
		<br>
		<hr id="line-1-hr-index">
		<br>
		<fieldset id="fset-loginsuccess">
			<h3>
				<%=mvResult.getUserName() + "님 환영합니다"%>
			</h3>
		</fieldset>
		<br> <a href="mypage.jsp">마이페이지</a> &nbsp; <a href="logout.jsp">로그아웃</a>
		<%
			}
		%>
	</div>
</body>

</html>