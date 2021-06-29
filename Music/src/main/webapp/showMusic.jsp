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
    border: 2px solid #3C8DAD;
    border-collapse: collapse;
    width: 550px;
    
    padding-top: 10px;
    padding-bottom: 10px;
	}
	
	table {
	border: 4px solid #3C8DAD;
	}
	
	.melon{
		float:left;
		display: inline-block;
	}
	.Bugs{
		float:left;
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
		font-family: 'Indie Flower', cursive;
		background-color: black;
		color : white;
		line-height: 120px;
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
		width: 60px;
		height: 45px;
		padding-bottom: 5px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id=title>Music Rank</div>
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
	<form method="get" action="showMusic.jsp">
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
	<div class=search>
		<form method="post" id="move" action="">
			<input type="text" id="searchBox" name="keyWord" placeholder="검색어 입력">
			<input type="submit" id="search" value="검색">
		</form>
	</div>
	<div>
		<div class="melon">
			<table id="melon">
				<tr>
					<td colspan="3"><b>Melon</b></td>
				</tr>
				<tr>
					<td class="rank"><b>Rank</b></td>
					<td><b>Title</b></td>
					<td><b>Singer</b></td>
				</tr>
				<%
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
		<div class="Bugs">
			<table id="Bugs">
				<tr>
					<td colspan="3"><b>Bugs</b></td>
				</tr>
				<tr>
					<td class="rank"><b>Rank</b></td>
					<td><b>Title</b></td>
					<td><b>Singer</b></td>
				</tr>
				<%
				site = "Bugs";
				musicList = musicService.selectAll(time, site, hour);
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
		<div class="Genie">
			<table id="Genie">
				<tr>
					<td colspan="3"><b>Genie</b></td>
				</tr>
				<tr>
					<td class="rank"><b>Rank</b></td>
					<td><b>Title</b></td>
					<td><b>Singer</b></td>
				</tr>
				<%
				site = "Genie";
				musicList = musicService.selectAll(time, site, hour);
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
</body>
</html>