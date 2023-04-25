<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.InputStream"%>
<%@page import="repository.Users"%>
<%@page import="data.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--사용자가 넘기는 데이터를 추출하고 안넘기는 거는 세션에 있는 데이터를 활용해서
        User.updateOne()을 사용해주면 됨
        /home/index.jsp혹은 /home/setting.jsp 그 결과에 따라서  --%>
        <%
        
        User user = (User)session.getAttribute("logonUser");	
    	String id = user.getId();
        
     //saveDirectory를 resource/profile/[로그인 아이디]/랜덤값
    String path = application.getRealPath("/resource/profile/"+id);
	File pathFile = new File(path);
	if(! pathFile.exists()) {
		pathFile.mkdirs();
	}
	System.out.println("path = " + path);
	MultipartRequest multi = new MultipartRequest(request, path,  1024*1024*20, "utf-8");
	
	String genCode = Long.toString(System.currentTimeMillis());
	multi.getFile("attath").renameTo(new File(path, genCode));
	
	String nick = multi.getParameter("nick");
	String profile = multi.getParameter("profile");
	
	String img = "/resource/profile/"+id+"/"+genCode;
	
	int r = Users.updateOne(id, nick, profile, img);
	
	
	if(r == 1) {
		session.setAttribute("logonUser", Users.findById(id));
		response.sendRedirect("./index.jsp");
	
	} else {
		response.sendRedirect("./setting.jsp?error");
	}
      
       %>
       
       <%--
        path : <%=path %>
        genCode : <%=genCode %>
        realFileAddress : <%=new File(path,genCode).getAbsolutePath() %></br>
        url : <%="/resource/pofile/"+id+"/"+genCode %></br>
        nick:<%=nick %></br>
        profile : <%=profile%><br/>
        --%>
        

        
        <%-- 
        
 //multipart 요청은 처리방법이 달라서 getparameter로 데이터가 안나옴           
        //String nick = request.getParameter("nick");
        //String profile = request.getParameter("profile");
        //String attach = request.getParameter("attach");
       
        //servlets.com 유저 라이브러리 멀티파트 요청을 처리해주는 라이브러리
       // InputStream is = request.getInputStream();
        
       // while(true){
        	//int r = is.read();
        	//if(r==-1){
        	//	break;
        	//}
        	//out.print(Integer.toHexString(r).toUpperCase()); //16진수로 나옴
       // }
  //  %>
    --%>