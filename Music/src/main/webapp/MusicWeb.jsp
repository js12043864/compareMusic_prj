<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kopo12.domain.*" %>
<%@ page import="kopo12.dao.*" %>
<%@ page import="kopo12.service.*" %>
<%@ page import="java.util.*,java.text.*" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
	#title {
		margin-bottom: 40px;
		height: 120px;
		font-size: 60px;
		text-align: center;
		text-decoration: none;
		background-color: #5F5F5F;
		color : white;
		line-height: 120px;
		width: 100%;
	}
	#tit{
	color: white;
	text-decoration: none;
	}

	#tit a {
    text-decoration: none;
    color : white;
	}
	body {
		margin: 0;
		background-color: #FBFCFD;
	}
	.button{
  margin-top: 100px;
  background:#5F5F5F;
  color: white;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  width: 300px;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius: 12px;
}
.button:hover{
  background: white;
  color:#5F5F5F;
}
.button:before, .button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #5F5F5F;
  transition:400ms ease all;
}
.button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.button:hover:before, .button:hover:after{
  width:100%;
  transition:800ms ease all;
}
#melon,#bugs,#genie{

}
</style>
</head>
<body>
	<%
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("HH:00");
	String hour = sdf.format(cal.getTime());
	%>
	<div id=title><a href="MusicWeb.jsp" id="tit">쏭<i class="fas fa-headphones-alt"></i>나와</a></div>
	<center><input type="button" onclick="location.href='Melon.jsp?hour=<%= hour %>'" value="멜론 실시간 차트" class=button id=melon></center>
	<center><input type="button" onclick="location.href='Bugs.jsp?hour=<%= hour %>'" value="벅스 실시간 차트" class=button id=bugs></center>
	<center><input type="button" onclick="location.href='Genie.jsp?hour=<%= hour %>'" value="지니 실시간 차트" class=button id=genie></center>
	<center><input type="button" onclick="location.href='showMusic.jsp?hour=<%= hour %>'" value="3사 실시간 차트" class=button></center>
</body>
</html>