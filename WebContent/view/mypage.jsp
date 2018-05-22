<%@page import="jsp.member.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="../CSS/stylesheet.css" rel="stylesheet">
<title>마이페이지</title>
</head>

<body>
	<div class="wrapper">
		<%
			MemberVo mv = (MemberVo) session.getAttribute("user");
			if (mv != null) {
		%>
		<h1>
			<%=mv.getUserName() + "님의 회원 정보"%>
		</h1>
		<br>
		<hr id="line-1-hr-index">
		<br>
		<form action="#" method="post">
			<pre>
 아이디       <input type="text" name="userId" id="userId" value="<%= mv.getUserId() %>" readonly="readonly">

비밀번호     <input type="password" name="userPwd" id="userPwd" value="<%= mv.getUserPwd()%>" readonly="readonly">

  이름         <input type="text" name="userName" id="userName" value="<%= mv.getUserName() %>" readonly="readonly">

  지역         <input type="text" name="userLocation" id="userLocation" value="<%= mv.getUserLocation() %>" readonly="readonly">

 이메일       <input type="text" name="userMail" id="userMail" value="<%= mv.getUserMail() %>" readonly="readonly">

 가입일       <input type="text" name="enterDate" id="enterDate" value="<%= mv.getEnterDate() %>" readonly="readonly">
		</pre>
		</form>
		<button type="button" id="signUpBtn" onclick="back();">뒤로가기</button>
		<%
			} else {
		%>
		<h1>
			<%="회원 정보가 없습니다"%>
		</h1>
		<%
			}
		%>
	</div>
</body>

<script>
	function back() {
		history.back(-1);
	}

</script>

</html>