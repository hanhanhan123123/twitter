<%--
	이 페이지의 목적은 로그인을 처리해주는 작업
 --%>
<%@page import="data.User"%>
<%@page import="repository.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url=request.getParameter("url");
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	
	User one = Users.findById(userId);
	if(one == null) {
		response.sendRedirect("./login.jsp?error=1");
	
	} else {
		String dbPass = one.getPass();
		if(dbPass.equals(password)){

		session.setAttribute("logon", true);
		//이때 찾았던 정보를 logonUser로 올려둠↓
		response.sendRedirect("/home/index.jsp");
		session.setAttribute("logonUser", one);
		
		}else{
			response.sendRedirect("./login.jsp?error=1");
		}
	}
	
		//==================================================
				
		//==================================================
%>
<%-- //성공했다면 홈의 인덱스로 보냄
//사용자의 유효성 정보 체크하고 데이터가 있다면? 사용자 세션에 로그온을 트루로 바꿔주고
// 인덱스로 바꿔주면 성공했다면 홈 화면이 보여짐. 아이디랑 비번이 일치했을때만 처리
--%>
 
