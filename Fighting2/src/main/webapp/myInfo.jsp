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
				<th bgcolor="whitesmoke">���̵�</th>
				<td>${user.getId() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">��й�ȣ</th>
				<td>${user.getPassword() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">�̸�</th>
				<td>${user.getName() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">����</th>
				<td>${user.getRole() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">�г���</th>
				<td>${user.getNickName() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">��ȭ��ȣ</th>
				<td>${userDetail.getPhoneNumber1() } -
					${userDetail.getPhoneNumber2() }</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">�ּ�</th>
				<td>${userDetail.getAddress()}</td>
			</tr>
			<tr>
				<th bgcolor="whitesmoke">�̸���</th>
				<td>${userDetail.getEmail() }</td>
			</tr>
		</table>
		<a href="getBoardList.do">Home</a>
	</center>
</body>
</html>