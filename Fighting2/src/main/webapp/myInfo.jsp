<%@page import="com.springbook.biz.userdetail.UserDetailVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
UserDetailVO userDetail = (UserDetailVO) session.getAttribute("userDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<p>
			<img alt=""
				src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAyMDA3MzBfMTkz%2FMDAxNTk2MDY5NDIwNjYz.8ZFIuGjxw5IsOZZaG52f4GXEYFqmQHnLzis6hD79EbAg.95AAgJXak78TS2UD4yQxxpNx2mywhzoxfxW5aIFlPvUg.GIF%2Fdefault.gif&type=sc960_832_gif">
		</p>
		<table border="1">
			<tr>
				<th bgcolor="whitesmoke">아이디</th>
				<td>${user.getId() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">비밀번호</th>
				<td>${user.getPassword() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">이름</th>
				<td>${user.getName() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">직업</th>
				<td>${user.getRole() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">닉네임</th>
				<td>${user.getNickName() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">전화번호</th>
				<td>${userDetail.getPhoneNumber1() } -
					${userDetail.getPhoneNumber2() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">주소</th>
				<td>${userDetail.getAddress()}</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">이메일</th>
				<td>${userDetail.getEmail() }</td>
			</tr>
		</table>
		<a href="getBoardList.do">Home</a>
	</center>
</body>
</html>