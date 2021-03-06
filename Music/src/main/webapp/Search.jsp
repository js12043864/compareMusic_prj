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
<title>Insert title here</title>
</head>
<body>
	<div id=title><a href="MusicWeb.jsp" id="tit"><i class="fas fa-headphones-alt"></i>?????????</a></div>
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
		<div class=search>
		<form method="post" id="move" action="showMusic.jsp?hour=<%= hour %>">
			<input type="submit" id="search" value="????????????">
		</form>
	</div>
	<center><span id=key style="margin-bottom: 5px;"><b>"<%= keyword %>" ????????????</b></span></center>
	<div>
		<div class="melon">
			<table id="melon">
				<tr>
					<td colspan="3" class=first><img width="142" height="99" src="https://cdnimg.melon.co.kr/resource/image/web/common/logo_melon142x99.png" alt="MelOn ?????? ?????????"></td>
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
		<div class="Bugs">
			<table id="Bugs">
				<tr>
					<td colspan="3" class=first><img alt="????????? ??????." src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Bugs%21_logo.jpg/250px-Bugs%21_logo.jpg" decoding="async" width="142" height="99"width="142" height="99" srcset="//upload.wikimedia.org/wikipedia/commons/e/ef/Bugs%21_logo.jpg 1.5x" data-file-width="288" data-file-height="216"></td>
				</tr>
				<tr>
					<td class="rank"><b>RANK</b></td>
					<td><b>TITLE</b></td>
					<td><b>SINGER</b></td>
				</tr>
				<%
				site = "Bugs";
				musicList = musicService.selectAll(time, site, hour);
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
		<div class="Genie">
			<table id="Genie">
				<tr>
					<td colspan="3" class=first><img id="wp_thbn_58" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHcAAAA2CAMAAADK4/ZxAAAATlBMVEX///8hqtgApdYAo9Xj8vgUqNdZud8AodTx+Pzs9vv5/P5mveCDyOXb7vej1evT6vXL5vO03O50wuOSzuia0elDsty/4fGr2O0yrtoAndKRYM4zAAAEYUlEQVRYhe1Y2XbrKgw1IrIxduJ5OP//oxckEJDh9PSuruSlemhtw2Zrlp2q+pWfEGM/w7vXn+FdmvkjvDXCJ4jtiQr69/O2WqlPEO+gPkK8oKNF3b27mmpH23SXN7NWlbO1vr6dtbr82cb3s1bVOH2C9X/Idbqtx/Bq1bZtmaCtE+P+m2Hcxy/i+QBOcpzgRZ/ipl50sPt8opNtNekoQN8O245goG6lUimfzRTAxxPqdgNfdb7woKMnk2rCPtuj4+A1OCLi6roDTIPAdJcdt4CKrDMEsAJ8iPwlwmndNfWr02PjtREhrSkd29DheQ9MuNSgJkcRtNjzg7FZ7qwVrekc2OfGXfNMOZpoatA6OLSPBwp107Kep8a4a214RwQ3e8G7RUfMfQd04f+QV3bNyPk4ZgZrjvHJ6uh67mvINGpJT025cSMwqH46Os1K5rQ3xunVUqSD/trn6IWRPYX6gpnB3Pw7snGiGyRHj7zglRuAj6X9fAOZwVaxHeGRUcEn/qYmy2NY6HwO3dUrhHG814l3pamwiUskE1fIEaKtHM5Iho5k7iZbfbjwTCrE5xRsdkSHUYUjaUneIprs1WsjGiX3Vy3akx2QeglKjDwTSM0yL7VlJblBV9qU4GSDyYLDfueYTj5HaKkWSbw+C9KZnVBYgmjXNQZWvyvBiZfXIc0Qww+uwVNcXixK/KwLn5FppA9HBqow/jMw3yUMh1e38qAV6JwVvQhFzMcCJSPIL0hH3jBe1k/BKa9uKfFZ+P1ok8jrUqjpeGX1WCBYDVKVLrnA78HHa95eoD6IeLaXUkzYA+KihbtcjDtfclHcg9NsCH6W+WG5O+zCWz2RuljgtPcncE5S0LCookcJeZVqAuSUWhXHW0MSdEuh4saD3hTuSpLxuN2Bs1FoeasKjyadypnLUmY6TejG3/q0Aplq1EyZIusVXFuRyCKBUzTDhpCO1aqzfOd8qfN9PO0orSQyvI0W5tS4bkVf3LBwqpcxjApcjj7OWk5OGzQabGV2zk/2unNE5v8lja8tDSNDHQQ65592UphbUBjsZ6yr7jASeUgsYcJ5ISSwkVtxCKUVjS/DirI35zi4IY5fU/LGCUTwXklGVlwMWdWHWFt/vQqejfGH8pQKnjDZywilzMMnRHtG98JEvsUz5EObYRE21qaldxzpGjRo8rSKrX4o3p7qO2uDQ/27JPSGKyE50c4aqL2C3tj311r7LY10jb3xy5TDbrNLWkn0tmsCuKnLN5wkw75TOnCSJCe6l9hlnud+CjxreN9Kc3NcvJD5++QlM8xMfQ7OFsZhGMbsbZ083rz8mltiRP7Sif5FzB+qZ9Gnf5bwSQYd8++V3/5VONsjEXer5uXXSpyMz7v2d4S7BtIXq+n1Fz4MFYf4ELBvS5jPGk5swqmvN8+U7fppTXxTbOwa8u8vPxHYDhp8WRPfE7PlH0CxObzc/YO/Pq4gH3x4+3r7z4l136iOe+t/xoO/8isfkP8AZMkqpWlCaGIAAAAASUVORK5CYII=" class="rISBZc M4dUYb" width="142" height="99" alt="" data-atf="1"></td>
				</tr>
				<tr>
					<td class="rank"><b>RANK</b></td>
					<td><b>TITLE</b></td>
					<td><b>SINGER</b></td>
				</tr>
				<%
				site = "Genie";
				musicList = musicService.selectAll(time, site, hour);
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
</body>
</html>