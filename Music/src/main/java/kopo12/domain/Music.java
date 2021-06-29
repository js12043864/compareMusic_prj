package kopo12.domain;

public class Music {
	private int ranking;
	private String musSite;
	private String date;
	private String hour;
	private String musTitle;
	private String singer;
	
	public Music() {
		
	}
	
	
	public int getRanking() {
		return ranking;
	}


	public void setRanking(int ranking) {
		this.ranking = ranking;
	}


	public String getMusSite() {
		return musSite;
	}
	public void setMusSite(String musSite) {
		this.musSite = musSite;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public String getMusTitle() {
		return musTitle;
	}
	public void setMusTitle(String musTitle) {
		this.musTitle = musTitle;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	
}
