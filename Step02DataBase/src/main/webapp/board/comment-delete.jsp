<%@page import="test.Dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 댓글번호
	int num=Integer.parseInt(request.getParameter("num"));
	//리다일렉트 이동할때 필여한 원글의 번호
	String parentNum=request.getParameter("parentNum");
	//dao 객체를 이용해서 삭제하고
	CommentDao.getInstance().delete(num);
	//리다일렉트 이동
	String cpath=request.getContextPath();
	response.sendRedirect(cpath+"/board/view.jsp?num="+parentNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/comment-delete.jsp</title>
</head>
<body>

</body>
</html>