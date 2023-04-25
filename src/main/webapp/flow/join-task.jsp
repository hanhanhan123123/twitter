<%--join.jsp에서 제출된 내용을 토대로 DateBase에 신규 유저 정보를 등록하는 처리를 하는 곳 
    계정 만드는 작업 하는 곳--%>
<%@page import="repository.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    //포스트는 받아주는 곳에서 문자지정을 해줘야 문자가 안깨짐
    
    //아이디 한글로 안되게 막는 방법
    String id = request.getParameter("id");
    if (!id.matches("[A-Za-z][A-Za-z0-1]+")){
    }
    id = id.toUpperCase();
    
   // String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String nick = request.getParameter("nick");
    
    int r = Users.create(id, pass, nick);
    
    if(r == 1) {
		//가입과 동시에 로그온상태 변경하는 첫번째 방법!
    	//response.sendRedirect("./login-task.jsp?userId="+id+"&password="+pass);
		//방법2
		session.setAttribute("logon",true);
		session.setAttribute("logonUser", Users.findById(id));
		response.sendRedirect("/home/index.jsp");
		
		//이게 아니면 로그인부터 하라고 보내는 방법도 있음!
		//response.sendRedirect("./login.jsp");
		//이렇게 하면 에러가 뜸 Redirect한번보내면 두번이상 보낼 수 없다.
		return;
	}
    %>
<%@ include file="/commons/top.jsp" %>
<div class = "root">
<%if(r==1){ %>
<h1>환영합니다</h1>
<%}else{%>
<h1>가입처리에 실패하였습니다</h1>
<p> 이미 처리중인 작업입니다.</p>
<%} %>
</div>
<%@ include file="/commons/bottom.jsp"%>