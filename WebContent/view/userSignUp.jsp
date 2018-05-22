<%@page import="jsp.sendmail.MemberSendMail"%>
<%@page import="jsp.member.service.MemberService"%>
<%@page import="jsp.member.vo.MemberVo"%>
<%@page import="jsp.encrypt.sha256.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>title</title>
</head>
<body>
	<h1>TEST 페이지</h1>
	<h2>받아 온 값</h2>
	<hr>
	<h3>
		<%
			request.setCharacterEncoding("utf-8");
			String userId = request.getParameter("userId");
			String userPwd = new SHA256().enctyptSHA256(request.getParameter("userPwd"));
			String userName = request.getParameter("userName");
			String userEmail = request.getParameter("userEmail");
			String[] userGender = request.getParameterValues("userGender");
			String[] userLocation = request.getParameterValues("userLocation");

			MemberVo mv = new MemberVo();

			mv.setUserId(userId);
			mv.setUserPwd(userPwd);
			mv.setUserName(userName);
			mv.setUserMail(userEmail);
			mv.setUserLocation(userLocation[0]);
			mv.setUserGender(userGender[0]);

			int result = new MemberService().memberSignUp(mv);

			if (result > 0) {
				new MemberSendMail().sendMail(mv.getUserMail(), mv.getUserId());
				
		%>
		<script>
			alert('회원 가입 완료');
			window.location.href = "login.html";
		</script>
		<%
			} else {
		%>
		<script>
			alert('회원 가입 실패');
			window.location.href = "login.html";
		</script>
		<%
			}
		%>
		%>
	</h3>
</body>
</html>