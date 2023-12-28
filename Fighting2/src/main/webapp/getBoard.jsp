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
BoardVO board = (BoardVO) session.getAttribute("board");
UserVO user = (UserVO) session.getAttribute("user");
List<CommentVO> commentList = (List) request.getAttribute("commentList");
%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>미니 프로젝트</title>
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
					<li><a href="myActive.do">나의 활동</a></li>
					<li><a href="myInfo.do">개인 정보</a></li>
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
					<a href="#">회원가입</a>
				</p>
				<p>
					<a href="#">아이디 찾기</a>
				</p>
				<p>
					<a href="#">비밀번호 찾기</a>
				</p>
				<img width="200"
					src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTA3MjRfMjgx%2FMDAxNTYzOTYyMTg0ODIz.Zy50i7zAVW8fWauMfFyqCmrKyz4ZRU8YXxtasnDYM8kg.h3D-FNJGDogoK4GgYGy90VGFKa4nLhrY6hSK-l2lsDQg.GIF.theworkscompany%2F4.gif&type=sc960_832_gif">

			</div>

			<div class="col-sm-4 text-legt">
				<h1>글상세</h1>
				<h3>${user.nickName }님 환영합니다.</h3>
				<form action="updateBoard.do" method="post">
					<input type="hidden" name="seq" value=${board.seq }>
					<table border="1" width="600">
						<tr>
							<th width="150" bgcolor="whitesmoke" style="text-align: center;">번호</th>
							<td colspan="3">${board.seq }</td>
						</tr>
						<tr>
							<th bgcolor="whitesmoke" style="text-align: center;">제목</th>
							<td colspan="3"><input type="text" value="${board.title }"
								name="title"></td>
						</tr>
						<tr>
							<th bgcolor="whitesmoke" style="text-align: center;">작성자</th>
							<td colspan="3">${board.writer }</td>
						</tr>
						<tr>
							<th bgcolor="whitesmoke" style="text-align: center;">내용</th>
							<td colspan="3"><textarea rows="10" cols="40" name="content">${board.content }</textarea>
							</td>
						</tr>
						<tr>
							<th bgcolor="whitesmoke" style="text-align: center;">날짜</th>
							<td colspan="3">${board.regDate }</td>
						</tr>
						<tr>
							<th bgcolor="whitesmoke" style="text-align: center;">조회수</th>
							<td>${board.cnt }</td>
							<th bgcolor="whitesmoke" style="text-align: center;" width="100">좋아요</th>
							<td>${board.b_like }<a href="b_like.do?seq=${board.seq}">좋아요</a></td>
						</tr>
						<c:if
							test="${user.getNickName().equals(board.getWriter())||user.getRole().equals('관리자')}">
							<tr>
								<td colspan="5"><input type="submit" value="글수정"></td>
							</tr>
						</c:if>
					</table>
				</form>
			</div>
			<div class="col-sm-4 text-left">
				<div class="col-sm-4 text-left">

					<h1 align="center">댓글상세</h1>

					<form action="insertComment.do" method="post">
						<table border="1" cellpadding="0" cellspacing="0" width="600">

							<tr>
								<th colspan="100" align="center" bgcolor="WhiteSmoke">댓글
									등록</th>
							</tr>
							<tr>
								<td><input type="hidden" name="seq"
									value="${board.getSeq()}"></td>
								<td><input type="hidden" name="co_nickName"
									value="${user.getNickName()}">${user.getNickName()}가
									댓글달아욤</td>
								<td><textarea rows="5" cols="50" name="co_content"></textarea></td>
								<td><input type="submit" value="등록"></td>
							</tr>
						</table>
					</form>

					<table border="1" cellpadding="0" cellspacing="0" width="600">

						<tr>
							<th colspan="100" align="center" bgcolor="WhiteSmoke">댓글</th>
						</tr>

						<c:forEach items="${commentList }" var="comment">
							<tr>
								<td>${comment.co_seq }</td>
								<td>${comment.getCo_nickName()}</td>
								<td>${comment.getCo_content()}</td>
								<td>${comment.getCo_regDate()}</td>
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
					<p>우리 귀여운 오리너구리 봐주세요</p>
				</div>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>
			<a href="getBoardList.do">목록보기</a>&nbsp;&nbsp;&nbsp;


			<c:if
				test="${user.getNickName().equals(board.getWriter())||user.getRole().equals('관리자')}">
				<a href="deleteBoard.do?seq=${board.seq}">글삭제하기</a>
			</c:if>
			&nbsp;&nbsp;&nbsp; <a href="insertBoard.jsp">새글등록하기</a>
		</p>
	</footer>

</body>
</html>