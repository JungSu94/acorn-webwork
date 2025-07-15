<%@page import="test.Dao.BookDao"%>
<%@page import="test.Dto.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달되는 수정할 회원의 번호를 읽어온다
	int num=Integer.parseInt(request.getParameter("num"));
	//2. MemberDao 객체를 이용해서 수정할 회원의 정보를 얻어온다.
	BookDto dto=new BookDao().getByNum(num);
	//3. 수정할 회원의 정보를 수정 양식으로 응답한다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/updateform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>도서정보 수정 양식</h1>
		<form action="${pageContext.request.contextPath}/book/update.jsp" method="post">
			<div>
				<label for="num">번호</label>
				<input type="text" name="num" id="num" value="<%=dto.getNum() %>" readonly/>						
			</div>
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" value="<%=dto.getTitle() %>"/>		
			</div>	
			<div>
				<label for="author">저자</label>
				<input type="text" name="author" id="author" value="<%=dto.getAuthor() %>"/>
			</div>
			<div>
				<label for="publisher">출판사</label>
				<input type="text" name="publisher" id="publisher" value="<%=dto.getPublisher() %>"/>
			</div>
			<button type="submit">수정</button>
			<button type="reset">취소</button>			
		</form>
	</div>
</body>
</html>