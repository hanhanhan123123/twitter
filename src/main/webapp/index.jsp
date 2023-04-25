<%--첫 환영 페이지 웰컴페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/top.jsp" %>

<div class="root">
<center><img src="/resource/img/twitter.png" /></center>
	<h1><center>♡트위터 홈♡</center></h1>
	</div>
	<div class="sticky">
	<span style="font-size:2em; color:blue"><center>환영합니다</center> </span>
	<p>
		<a href="./flow/login.jsp" class="sticky-btn"><center><button>로그인</button></a></center>
		</p>
		<p>
		<a href="./flow/join.jsp" class="sticky-btn"><center><button>가입하기</button></a></center>
	</p>
</div>
<%@ include file="/commons/bottom.jsp" %>
   