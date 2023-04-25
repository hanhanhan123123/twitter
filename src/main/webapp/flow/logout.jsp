<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //방법1. 사용중인 세션을 애초에 죽이는 방법 --일반적인 방법
    session.invalidate();
    
    
    //방법2. 다른방법은 사용중이던 값들을 변경
   	//session.setAttribute("logon", false);
    //session.setAttribute("logonUser", null);
    //session.removeAttribute("logonUser");
   	
    
    //방법 1과 2 중에 하나만 하면 됨. 2개는 안됨
    response.sendRedirect("/flow/login.jsp");
    %>
    
