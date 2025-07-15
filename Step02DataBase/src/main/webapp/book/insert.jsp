<%@page import="test.Dao.BookDao"%>
<%@page import="test.Dto.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 추가할 회원의 이름과 주소를 추출한다.
	String title=request.getParameter("title");
	String author=request.getParameter("author");
	String publisher=request.getParameter("publisher");
	//DB에 저장하기 위해 name, addr 을 MemberDto 객체에 담는다.
	BookDto dto=new BookDto();
	dto.setTitle(title);
	dto.setAuthor(author);
	dto.setPublisher(publisher);
	//2. DB에 저장한다
	BookDao dao=new BookDao();
	boolean isSuccess=dao.insert(dto);
	//3. 클라이언트에게 응답한다
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/insert.jsp</title>
</head>
<body>
	<% if (isSuccess) { %>
		<p>
			<strong><%= title %></strong> 님의 정보를 성공적으로 저장했습니다.
			<a href="${pageContext.request.contextPath}/book/list.jsp">확인</a>
		</p>
	<% } else { %>
		<p>
			회원 정보 저장에 실패했습니다.
			<a href="${pageContext.request.contextPath}/book/insertform.jsp">다시 입력하기</a>
		</p>
	<%}%>	
</body>
</html>