<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kopo12.domain.*" %>
<%@ page import="kopo12.dao.*" %>
<%@ page import="kopo12.service.*" %>
<%@ page import="java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
		border: 1px solid #1A1A1A;
	}
	#submit {
		background-color: #5F5F5F;
    	
    	border-radius: 4px;
    	color: white;
    	font-family: Apple SD Gothic Neo,arial,sans-serif;
    	font-size: 20px;
    	margin: 11px 4px;
    	padding: 0 16px;
    	line-height: 30px;
    	height: 36px;
    	text-align: center;
		
		width: 80px;
		height: 45px;
		
	}
	.search {
		margin-bottom: 15px;
		margin-left: 40px;
	}
	#searchBox{
		width: 200px;
		height: 34px;
		border: 1px solid #1A1A1A;
		padding-top: 6px;
		font-size: 14px;
	}
	#search{
		width: 60px;
		height: 45px;
		background-color: #5F5F5F;
    	
    	border-radius: 4px;
    	color: white;
    	font-family: Apple SD Gothic Neo,arial,sans-serif;
    	font-size: 20px;
    	margin: 11px 4px;
    	padding: 0 8px;
    	line-height: 30px;
    	text-align: center;
	}
	.first {
		background-color: white;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id=title><a href="MusicWeb.jsp" id="tit">쏭<i class="fas fa-headphones-alt"></i>나와</a></div>
	<%
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	String hour = request.getParameter("hour");
	String time = sdf1.format(cal.getTime());
	String site = "";
	MusicService musicService = MusicServiceImpl.getInstance();
	site = "Melon";
	ArrayList<String> hourList = musicService.hourList(time, site);
	%>
	<form method="get" action="Bugs.jsp">
		<div class="Time">
			<center>	
				<span id=time><%= time %>&nbsp;&nbsp;</span>
				<select name="hour" id=hour>
				<%
				Collections.sort(hourList);
				for(int i = 0; i < hourList.size(); i++) {
					if(hourList.get(hourList.size()-1-i).equals(hour)){
						out.print("<option selected>" + hourList.get(hourList.size()-1-i) + "</option>");
					}else{
						out.print("<option>" + hourList.get(hourList.size()-1-i) + "</option>");
					}
				}
				%>
				</select>
				<input type="submit" id=submit value="이동">
			</center>
		</div>
	</form>
	<center>
	<div class=search>
		<form method="post" id="move" action="SearchBugs.jsp?hour=<%= hour %>">
			<input type="text" id="searchBox" name="keyWord" placeholder="제목이나 가수를 입력하세요.">
			<button id="search"><i class="fas fa-search"></i></button>
		</form>
	</div>
	<div>
		<div class="Bugs">
			<table id="Bugs">
				<tr>
					<td colspan="3" class=first><img alt="벅스의 로고." src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Bugs%21_logo.jpg/250px-Bugs%21_logo.jpg" decoding="async" width="142" height="99"width="142" height="99" srcset="//upload.wikimedia.org/wikipedia/commons/e/ef/Bugs%21_logo.jpg 1.5x" data-file-width="288" data-file-height="216"></td>
				</tr>
				<tr>
					<td class="rank"><b>RANK</b></td>
					<td><b>TITLE</b></td>
					<td><b>SINGER</b></td>
				</tr>
				<%
				site = "Bugs";
				List<Music> musicList = musicService.selectAll(time, site, hour);
				for(Music music :  musicList){
					out.print("<tr>" +
								"<td class=\"rank\">" + music.getRanking() + "</td>" +
								"<td>" + music.getMusTitle() + "</td>" +
								"<td>" + music.getSinger() + "</td>" +
							"</tr>");
				}
				%>
			</table>
		</div>
	</div>
	</center>
</body>
</html>