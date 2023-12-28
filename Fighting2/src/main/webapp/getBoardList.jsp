<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="com.springbook.biz.board.BoardVO"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@ page import="com.springbook.biz.user.UserVO" %>
<%
List<BoardVO> boardList = (List) session.getAttribute("boardList");
UserVO user = (UserVO) session.getAttribute("user");

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
					<a href="memberJoin.jsp">회원가입</a>
				</p>
				<p>
					<a href="findId1.jsp">아이디 찾기</a>
				</p>
				<p>
					<a href="findPw1.jsp">비밀번호 찾기</a>
				</p>
				
				
				
				<img width="200" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTA3MjRfMjgx%2FMDAxNTYzOTYyMTg0ODIz.Zy50i7zAVW8fWauMfFyqCmrKyz4ZRU8YXxtasnDYM8kg.h3D-FNJGDogoK4GgYGy90VGFKa4nLhrY6hSK-l2lsDQg.GIF.theworkscompany%2F4.gif&type=sc960_832_gif">
			</div>
			<div class="col-sm-8 text-center">
				<h1>글목록</h1>
				<h3>${user.nickName }님 환영합니다.</h3>
				<form action="searchList.do" method="post">
					<table border="1" width="1250">
						<tr>
							<td colspan="5" align="right"><select name="searchCondition">
									<option value="title" />제목
									<option value="content" />내용
							</select> <input type="text" name="searchKeyword"> <input
								type="submit" value="검색"></td>
						</tr>
					</table>
				</form>
				<table border="1" width="1250">
					<tr>
						<th width="150" bgcolor="whitesmoke" style="text-align: center;">번호</th>
						<th width="300" bgcolor="whitesmoke" style="text-align: center;">제목</th>
						<th width="300" bgcolor="whitesmoke" style="text-align: center;">작성자</th>
						<th width="200" bgcolor="whitesmoke" style="text-align: center;">날짜</th>
						<th width="150" bgcolor="whitesmoke" style="text-align: center;">조회수</th>
						<th width="150" bgcolor="whitesmoke" style="text-align: center;">좋아요</th>
					</tr>
					<c:forEach items="${boardList }" var="board">
						<tr>
							<td>${board.seq }</td>
							<td><a href="getBoard.do?seq=${board.seq }">
									${board.title }</a></td>
							<td>${board.writer }</td>
							<td>${board.regDate }</td>
							<td>${board.cnt }</td>
							<td>${board.b_like }</td>
						</tr>
					</c:forEach>
				</table>
			
			</div>
			<div class="col-sm-2 sidenav">
				<div class="well">
					<p><img width="200" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2Foriginals%2Fad%2Fd6%2F32%2Fadd63298c4ce40a8d2b46abd13a776f7.gif&type=sc960_832_gif"> </p>
				</div>
				<div class="well">
					<p>우리 귀여운 오리너구리 봐주세요</p>
				</div>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>	<a href="insertBoard.jsp">새글 쓰기</a></p>
	</footer>

</body>
</html>