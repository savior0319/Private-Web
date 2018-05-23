<%@page import="jsp.member.service.MemberService"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<meta http-equiv="X-UA-Compatible" content="ie=edge">
			<link href="../CSS/stylesheet.css" rel="stylesheet">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<title>아이디 중복 체크</title>
		</head>

		<style>
			.wrapper {
				text-align: center;
			}

			#title {
				font-size: 20px;
				font-weight: 600;
				margin-bottom: 10px;
			}

			#clickBtn {
				margin-left: 10px;
			}

			#message {
				margin-top: 10px;
				margin-bottom: 5px;
			}
		</style>

		<body>
			<div class="wrapper">
				<div id="title">아이디 중복 체크</div>
				<input type="text" name="idDuplicate" id="idDuplicate">
				<button onclick="clickBtn();" id="duplicateBtn">중복확인</button>
				<br>
				<div id="message"></div>
				<button id="useThisId"></button>
			</div>
		</body>

		<script>
			$(document).ready(function () {
				var $idDuplicate = $('#idDuplicate'),
					$message = $('#message');

				function chkId() {
					resultId = false;
					regExgId = /^[a-zA-Z0-9_]{4,16}$/;
					resultId = regExgId.test($idDuplicate.val());
					if (resultId == true) {
						$message.hide();
					} else {
						$message.html('<br>소문자, 숫자, _ 를 포함한 4글자 이상').css('color', 'red').css(
							'font-size',
							'13px').fadeIn(300);
					}
				}

				$('#useThisId').hide();

				$idDuplicate.focus(function () {
					chkId();
					$idDuplicate.keyup(function () {
						chkId()
					});
				});

				$('#duplicateBtn').click(function () {
					if (resultId == true) {
						var idDuplicate = document.getElementById("idDuplicate").value;
						window.location.href = "idDuplicate.jsp?idDuplicate=" + idDuplicate;
					}
				});
			});

			window.onload = function () {

				<%String idDuplicate = request.getParameter("idDuplicate");
				
				if (idDuplicate != null) {%>
				document.getElementById("idDuplicate").value = '<%=idDuplicate%>';
				<%int isResult = new MemberService().idCheck(idDuplicate);
				
				if (isResult == 1) {%>
				$('#message').css('color', 'red').css('font-size', '14px').html("이미 사용 중인 아이디 입니다.");

				<%} else {%>
				$('#message').css('color', 'blue').css('font-size', '14px').html("사용 가능한 아이디 입니다");
				$('#useThisId').html('사용하기').fadeIn(0);

				document.getElementById("useThisId").addEventListener('click', function () {
					opener.document.getElementById("userId").value = '<%=idDuplicate%>' // 팝업에서 id 값을 넘겨줌

					close();
				});
				<%}%>
				<%}%>
			}
		</script>

		</html>