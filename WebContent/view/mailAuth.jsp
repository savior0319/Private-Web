<%@page import="jsp.member.service.MemberService"%>
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
	int authNumber = 0;
	String userEmail = request.getParameter("userEmail");

	/* 이메일 중복 여부 확인  */
	int result = new MemberService().CheckEmail(userEmail);
	if (result == 1) {
%>
<script>
	alert('이미 사용중인 이메일입니다');
	close();
</script>
<%
	} else {
		/* 인증 번호 생성 */
		authNumber = (int) (Math.random() * 799999) + 200000;
		/* 	System.out.println("랜덤 생성된 인증번호 : " + authNumber); */
		/* 메일전송  */
		new MemberSendMail().sendMail(userEmail, authNumber);
%>
<script>
	alert('<%=userEmail%>' + ' 로 인증번호가 발송되었습니다');
</script>
<%
	}
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
		<h3>인증번호입력</h3>
		<hr>
		<input type="text" placeholder="인증번호 입력" maxlength="6"
			id="inputNumber"> <br> <br>
		<button id="insertBtn">입력</button>
	</div>
</body>

<script>
 $('#insertBtn').click(function(){
	 if($('#inputNumber').val() == <%=authNumber%>){
		 alert('인증되었습니다');
		/* 이메일 인증 완료시 인증 받은 이메일 사용하게 설정*/
		 opener.document.getElementById("userEmail").value = '<%=userEmail%>';  
		 /* 이메일 인증 여부 확인 */
		 opener.document.getElementById("mailAuthChk").setAttribute('value', 'yes'); 
		 /* 이메일 인증 완료시 변경 불가능 */
		 opener.document.getElementById("userEmail").setAttribute('readonly', 'readonly'); 
		 /* 이메일 인증 완료시 버튼 비활성화 */
		 opener.document.getElementById("mailAuthBtn").setAttribute('disabled', true);
		 close();
	 } else {
		 alert('인증번호를 잘못 입력했습니다');
	 }
 });
</script>

</html>