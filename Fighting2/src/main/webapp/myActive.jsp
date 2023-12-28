<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="com.springbook.biz.board.BoardVO"%>
<%@ page import="com.springbook.biz.boardimpl.BoardDAO"%>
<%@ page import="com.springbook.biz.user.UserVO"%>
<%@ page import="com.springbook.biz.commentimpl.CommentDAO"%>
<%@ page import="com.springbook.biz.comment.CommentVO"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%

%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>�̴� ������Ʈ</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="logout.do">castlejun</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="getBoardList.do">Home</a></li>
					<li><a href="myActive.do">���� Ȱ��</a></li>
					<li><a href="myInfo.do">���� ����</a></li>
					<li><a href="bonobono.jsp">${user.nickName }</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<p>
					<a href="#">ȸ������</a>
				</p>
				<p>
					<a href="#">���̵� ã��</a>
				</p>
				<p>
					<a href="#">��й�ȣ ã��</a>
				</p>
			</div>

			<div class="col-sm-4 text-legt">
				<h1>�� �Խñ�</h1>
				<table border="1" width="600">
					<c:forEach items="${boardList }" var="board">
						<tr>
							<td bgcolor="whitesmoke" >����</td><td width="400" bgcolor="whitesmoke"> ${board.title}</td>

							<td colspan="10" >${board.regDate}</td>
							
						</tr>
						<tr>
						<td bgcolor="whitesmoke" >����</td>
							<td colspan="8" width="400">${board.content}</td>
							<td bgcolor="whitesmoke">���ƿ�</td><td> ${board.b_like }</td>
						</tr>

					</c:forEach>
				</table>
			</div>
			<div class="col-sm-4 text-left">
				<div class="col-sm-4 text-left">

					<h1 align="center">�� ���</h1>
					<table border="1" width="600">

						<c:forEach items="${commentList }" var="comment">
							<tr>
								<td bgcolor="whitesmoke" colspan="10">${comment.seq}�����ù� ���</td>

							</tr>
							<tr>
								<td>${comment.getCo_content()}</td>
								<td width="80">${comment.getCo_regDate()}</td>
							</tr>
						</c:forEach>

					</table>
				</div>



			</div>
			<div class="col-sm-2 sidenav">
				<div class="well">
					<p>
						<img width="200"
							src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2Foriginals%2Fad%2Fd6%2F32%2Fadd63298c4ce40a8d2b46abd13a776f7.gif&type=sc960_832_gif">
					</p>
				</div>
				<div class="well">
					<p>�츮 �Ϳ��� �����ʱ��� ���ּ���</p>
				</div>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>
			<a href="getBoardList.do">��Ϻ���</a>&nbsp;&nbsp;&nbsp;


			<c:if
				test="${user.getNickName()!=null&&user.getNickName().equals(board.getWriter())}">
				<a href="deleteBoard.do?seq=${board.seq}">�ۻ����ϱ�</a>
			</c:if>


			&nbsp;&nbsp;&nbsp; <a href="insertBoard.jsp">���۵���ϱ�</a>
		</p>
	</footer>

</body>
</html>