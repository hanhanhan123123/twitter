<%--좋아요 처리해 주는 곳 --%>
<%@page import="data.User"%>
<%@page import="java.util.UUID"%>
<%@ page import="repository.Follows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String code = UUID.randomUUID().toString().split("-")[0];
    User logon = (User)session.getAttribute("logonUser");
    String owner = logon.getId();
 
    String target = request.getParameter("target");
       
    int r = Follows.create(code, owner,target);
    %>
    <%=r %>
    <%@ include file="/commons/top.jsp"%>
    <div style="display: flex; height: 100vh; gap: 10px;">
	<%@ include file="/commons/side.jsp" %> 
	<%-- 센터 영역 --%>
	<div style="flex: 5">
   <div style="margin-top : 20vh">
			<%if(r==1) { %>
				"<%=target %>" ♡
			
			<%}else { %>
				"<%=target %>" 님을 좋아요하는데 오류가 발생하였습니다.
			<%} %>
			
		</div>	
	</div>
</div>
