<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//회원가입폼 이동
	 function registForm() {
        location.href = "<%= request.getContextPath() %>/registForm.user";
    }
</script>
</head>
<% String msg=request.getParameter("msg"); %>
<body>
<!-- <a href="boardList.board?pnum=1">글목록</a> -->
<form action="login.user" method="post" >
	<input type="hidden" name="command" value="login"/>
	<h1>Login in</h1>
	<input class="loginVal" type="text" name="id" placeholder="ID" required="required"/>
	<input class="loginVal" type="password" name="password" placeholder="PASSWORD" required="required"/>
	<input type="checkbox" value="remember-me"/><label>아이디 저장</label>
	<label style="color:red;"><small>${msg==null?"":msg}</small></label>
	<button type="submit">Sign in</button>
	<button type="button" onclick="registForm()">Sign Up</button>
</form>
</body>
</html>