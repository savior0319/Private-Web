<%@page import="jsp.member.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>로그아웃</title>
</head>
<body>
	<%
		MemberVo mv = (MemberVo) session.getAttribute("user");
		if (mv != null) {
			session.invalidate();
	%>
	<script>
		alert('로그아웃 했습니다');
		window.location.replace("login.html");
	</script>

	<%
		} else {
	%>
	<script>
		alert('회원 정보가 없습니다');
		window.location.replace("login.html");
	</script>
	<%
		}
	%>

</body>
</html>