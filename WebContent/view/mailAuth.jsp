<%@page import="jsp.sendmail.MemberSendMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>이메일 인증</title>
</head>

<%
	String userEmail = request.getParameter("userEmail");
	System.out.println(userEmail);

	int authNumber = (int) (Math.random() * 90000) + 5000;
	System.out.println("랜덤 생성된 인증번호 : " + authNumber);

	new MemberSendMail().sendMail(userEmail, authNumber);
%>

<style>
.wrapper {
	margin: 0 auto;
	display: table;
	text-align: center;
}
</style>

<body>
	<div class="wrapper">
		<h3>인증코드 입력</h3>
		<hr>
			<input type="text" placeholder="인증코드 입력" maxlength="6" id="inputNumber"> <br>
			<br> <button id="insertBtn"> 입력 </button>
	</div>
</body>

<script>
 $('#insertBtn').click(function(){
	 if($('#inputNumber').val() == <%= authNumber %>){
		 alert('인증되었습니다');
		 close();
	 } else {
		 alert('인증번호를 잘못입력했습니다');
	 }
 });
</script>

</html>