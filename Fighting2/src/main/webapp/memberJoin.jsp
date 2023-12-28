<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Cute join</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<!-- Custom styles for this template -->
<style>
body {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f8f9fa;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.form-signin .mb-4 {
	font-size: 2rem;
	color: #495057;
}

.form-signin img {
	width: 60px;
	height: 60px;
	margin-bottom: 20px;
}

.form-signin .form-floating input {
	height: auto;
	margin-bottom: 10px;
	border: none;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .btn-primary {
	background-color: #6c757d;
	border-color: #6c757d;
}

.form-signin .btn-primary:hover {
	background-color: #5a6268;
	border-color: #545b62;
}

.mt-5 {
	margin-top: 3rem !important;
}
</style>
</head>
<body class="text-center">

	<main class="form-signin">
		<form action="memberJoin.do" method="post">
			<img class="mb-4"
				src="https://cdn-icons-png.flaticon.com/512/608/608502.png" alt=""
				width="60" height="60">
			<h1 class="mb-4">회원가입</h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="id" name="id"> <label
					for="floatingInput">아이디</label>
			</div>

			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="password" name="password" required> <label
					for="floatingPassword">비밀번호</label>
			</div>

			<div class="form-floating">
				<input type="text" class="form-control" name="name"> <label
					for="floatingInput">이름</label>
			</div>

			<div class="form-floating">
				<select
					class="form-control" name="role">
					<option value="학생">학생</option>
					<option value="선생님">선생님</option>
					<option value="기타">기타</option>
				</select>
				<label for="role" class="form-label">직업</label> 
			</div>

			<div class="form-floating">
				<input type="text" class="form-control" name="nickName"> <label
					for="floatingInput">닉네임</label>
			</div>
			
			<div class="form-floating">
				<select class="form-control" name="phoneNumber1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="012">012</option>
				</select>
					<label for="phoneNumber1" class="form-label">휴대폰번호</label> 
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" name="phoneNumber2"> 
				<label
					for="floatingInput">휴대폰번호</label>
			</div>

			<div class="form-floating">
				<input type="text" class="form-control" name="address"> <label
					for="floatingPassword">주소</label>
			</div>
			<div class="form-floating">
			<input type="text" class="form-control" name="email"><label
					for="floatingPassword">이메일</label>
			</div>

			<div class="checkbox mb-3">
				<input class="form-check-input" type="checkbox" value="remember-me"
					id="rememberCheck" name="remember"> <label
					class="form-check-label" for="rememberCheck">저장</label>
			</div>

			<button class="w-100 btn btn-lg btn-primary" type="submit">회원가입</button>

			<p class="mt-3">계정이 있으신가요? <a href="login.jsp">로그인</a>
			</p>

		</form>
	</main>

</body>
</html>