<%@page import="repository.Users"%>
<%@page import="data.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--사용자가 넘기는 데이터를 추출하고 안넘기는 거는 세션에 있는 데이터를 활용해서
        User.updateOne()을 사용해주면 됨
        /home/index.jsp혹은 /home/setting.jsp 그 결과에 따라서  --%>
        <%
        request.setCharacterEncoding("utf-8");
       User user = (User)session.getAttribute("logonUser");
        
        String id = user.getId();
        String nick = request.getParameter("nick");
        String profile = request.getParameter("profile");
        String img = user.getImg();
        
        int r = Users.updateOne(id, nick, profile, img);
    	if(r == 1) {
    		session.setAttribute("logonUser", Users.findById(id));
    		response.sendRedirect("./index.jsp");

    	} else {
    		response.sendRedirect("./setting.jsp?error");
    	}
    %>