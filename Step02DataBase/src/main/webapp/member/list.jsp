<%@page import="test.util.DbcpBean"%>
<%@page import="java.util.List"%>
<%@page import="test.dao.MemberDao"%>
<%@page import="test.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. 회원 목록을 MemberDao 객체를 이용해서 얻어낸다
MemberDao dao= new MemberDao();
List<MemberDto> list= dao.selectAll();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Member/list.jsp</title>
<!-- bootstrap 이 동작하기 위한 css 와 javascript -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/navbar.jsp">
		<jsp:param value="member" name="thisPage"/>
	</jsp:include>
	<a href="${pageContext.request.contextPath}/member/insertform.jsp">회원 추가</a>
	<h2>회원 목록</h2>
		<table class="table table-striped">
			<thead class="table-dark">
   				<tr>
      				<th>번호</th>
   		  	    	<th>이름</th>
      				<th>주소</th>
      				<th>수정</th>
      				<th>삭제</th>
    			</tr>
    		</thead> 		   				
   		 <%
        for(MemberDto dto : list){
   		 %>
  		    <tr>
        		<td><%= dto.getNum() %></td>
       		 	<td><%= dto.getName() %></td>
      			<td><%= dto.getAddr() %></td>
      			<td><a href="updateform.jsp?num=<%=dto.getNum() %>">수정</a></td>
      			<td><a href="javascript:" class="deleteLink" data-num="<%=dto.getNum() %>">삭제</a></td>
   			</tr>
   		<%}%>
		</table>
		<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
		<script>
			
			document.querySelectorAll(".deleteLink").forEach(item=>{
				//item 은 클릭한 a 요소의 참조값
				item.addEventListener("click",(e)=>{
					//e.target 은 이벤트가 발생한 바로 그요소의 참조값이다.
					// "click" 이벤트가 발생한 a 요소에 data-num 속성의 value 를 읽어오기
					const num=e.target.getAttribute("data-num");
					const isDelete=confirm(num+" 번 회원을 삭제 하시겠습니까?");
					if(isDelete){
						//delete.jsp 페이지로 이동하게 하면서 삭제할 회원의 번호도 같이 전달되도록한다.
						location.href="${pageContext.request.contextPath}/member/delete.jsp?num="+num;
					}
				});
			});		
		</script>
</body>
</html>