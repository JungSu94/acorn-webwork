<%@page import="test.Dao.BookDao"%>
<%@page import="test.Dto.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. form 전송되는 수정할 회원의 정보를 추출한다.
	int num=Integer.parseInt(request.getParameter("num"));
	String title=request.getParameter("title");
	String author=request.getParameter("author");
	String publisher=request.getParameter("publisher");
	//2. MemberDao 객체를 이용해서 DB에 수정반영하기
	BookDto dto=new BookDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setAuthor(author);
	dto.setPublisher(publisher);
	boolean isSuccess=new BookDao().update(dto);
	//3. 응답하기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p>
			<strong><%=num %></strong> 번 도서의 정보를 수정했습니다.
			<a href="list.jsp">확인</a>
		</p>
	<%}else{ %>
		<p>
			수정실패! <a href="updateform.jsp?num=<%=num %>">다시 수정하러 가기</a>
		</p>
	<%}%>
</body>
</html>