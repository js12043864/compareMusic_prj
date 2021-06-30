<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kopo12.domain.*" %>
<%@ page import="kopo12.dao.*" %>
<%@ page import="kopo12.service.*" %>
<%@ page import="java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
	table,td {
    border: 2px solid #151757;
    border-collapse: collapse;
    width: 550px;
    font-size: 13px;
    font-family: 
    padding-top: 10px;
    padding-bottom: 10px;
	}
	
	table {
	border: 3px solid #151757;
	}
	body {
		margin: 0;
		background-color: white;
	}
	.melon{
		
		display: inline-block;
	}
	.Bugs{
		
		display: inline-block;
	}
	.Genie{
		display: inline-block;
	}
	#melon{
		margin-left: 40px;
		text-align: center;
	}
	#Bugs{
		margin-left: 75px;
		text-align: center;
	}
	#Genie{
		margin-left: 75px;
		text-align: center;			
	}
	.rank {
		width: 50px;
	}
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
	.Time {
		margin-bottom: 40px;
		font-size: 2em;
	}
	#time {
	
	}
	#hour {
		width: 100px;
		height: 45px;
		padding-bottom: 5px;
		padding-top: 5px;
		font-size: 20px;
	}
	#submit {
		width: 80px;
		height: 45px;
		padding-bottom: 5px;
		padding-top: 5px;
	}
	.search {
		margin-bottom: 15px;
		margin-left: 40px;
	}
	#searchBox{
		width: 200px;
		height: 40px;
	}
	#search{
		width: 100px;
		height: 45px;
		
		background-color: #5F5F5F;
    	
    	border-radius: 4px;
    	color: white;
    	font-family: Apple SD Gothic Neo,arial,sans-serif;
    	font-size: 14px;
    	margin: 11px 4px;
    	padding: 0 16px;
    	line-height: 27px;
    	height: 36px;
    	font: bold;
    	
    	text-align: center;
    	cursor: pointer;
    	user-select: none;
	}
	.first {
		background-color: white;
	}
</style>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id=title><a href="MusicWeb.jsp" id="tit"><i class="fas fa-headphones-alt"></i>쏭나와</a></div>
	<%
	request.setCharacterEncoding("utf-8");
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	String hour = request.getParameter("hour");
	String time = sdf1.format(cal.getTime());
	String keyword = request.getParameter("keyWord");
	String site = "";
	MusicService musicService = MusicServiceImpl.getInstance();
	site = "Melon";
	ArrayList<String> hourList = musicService.hourList(time, site);
	%>
		<div class="Time">
			<center>	
				<span id=time><%= time %>&nbsp;&nbsp;</span>
				<span id=time><%= hour %></span>
			</center>
		</div>
		<center>
		<div class=search>
		<form method="post" id="move" action="Melon.jsp?hour=<%= hour %>">
			<input type="submit" id="search" value="뒤로가기">
		</form>
	</div>
	
		<center><span id=key style="margin-bottom: 5px;"><b>"<%= keyword %>" 검색결과</b></span></center>
	
	<div>
		<div class="melon">
			<table id="melon">
				<tr>
					<td colspan="3" class=first><img width="142" height="99" src="https://cdnimg.melon.co.kr/resource/image/web/common/logo_melon142x99.png" alt="MelOn 로고 이미지"></td>
				</tr>
				<tr>
					<td class="rank"><b>RANK</b></td>
					<td><b>TITLE</b></td>
					<td><b>SINGER</b></td>
				</tr>
				<%
				List<Music> musicList = musicService.selectAll(time, site, hour);
				for(Music music :  musicList){
					if(music.getSinger().contains(keyword) || music.getMusTitle().contains(keyword)){
					out.print("<tr>" +
								"<td class=\"rank\">" + music.getRanking() + "</td>" +
								"<td>" + music.getMusTitle() + "</td>" +
								"<td>" + music.getSinger() + "</td>" +
							"</tr>");
					}
				}
				%>
			</table>
		</div>
	</div>
	</center>
</body>
</html>