package kopo12.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


import kopo12.domain.Music;

public class MusicDaoImpl implements MusicDao {
	
	private static MusicDaoImpl instance = new MusicDaoImpl();		//for singleton
	
	private MusicDaoImpl() {	//constructor for sigleton
		
	}
	
	public static MusicDaoImpl getInstance() {		//singleton method
		return instance;
	}

	@Override
	public void create(List<List<String>> List) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:00");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String hour = sdf.format(cal.getTime());
		String time = sdf1.format(cal.getTime());
		Statement stmt = null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.16:3306/kopoctc", "root", "kopoctc");
		try {
			for (int i = 0; i < List.size(); i++) {
				stmt = conn.createStatement();
				if (i >= 100 && i < 200) {
					stmt.execute("insert into MusicTB values(" + (i-99) + ",\"Bugs\", \"" + time + "\", \"" + hour + "\", \"" + List.get(i).get(3)
							+ "\", \"" + List.get(i).get(4) + "\");");

				} else if (i < 100) {
					stmt.execute("insert into MusicTB values(" + (i+1) + ",\"Melon\", \"" + time + "\", \"" + hour + "\", \"" + List.get(i).get(0)
							+ "\", \"" + List.get(i).get(1) + "\");");
				} else {
					if(List.get(i).size() == 4) {
						String singer = List.get(i).get(3).substring(0,List.get(i).get(3).indexOf("|"));
						stmt.execute("insert into MusicTB values(" + (i-199) + ",\"Genie\", \"" + time + "\", \"" + hour + "\", \"" + List.get(i).get(2)
								+ "\", \"" + singer + "\");");
	                  }else {
	                	String singer = List.get(i).get(4).substring(0,List.get(i).get(4).indexOf("|"));
	                	stmt.execute("insert into MusicTB values(" + (i-199) + ",\"Genie\", \"" + time + "\", \"" + hour + "\", \"" + List.get(i).get(3)
	  							+ "\", \"" + singer + "\");");
	                  }
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {stmt.close();}
	}

	@Override
	public Music selectOne(String time, String site, String hour, String keyWord) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Music> selectAll(String time, String site) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.16:3306/kopoctc", "root", "kopoctc");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from MusicTB where musSite = \"" + site + "\" and date = \"" + time + "\";");
		List<Music> showMusic = new ArrayList<Music>();
		while (rset.next()) {
			Music music = new Music();
			music.setRanking(rset.getInt(1));
			music.setMusSite(rset.getString(2));
			music.setDate(rset.getString(3));
			music.setHour(rset.getString(4));
			music.setMusTitle(rset.getString(5));
			music.setSinger(rset.getString(6));
			showMusic.add(music);
		}
		rset.close();
		stmt.close();
		conn.close();
		return showMusic;
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Music music) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Music> selectAll(String time, String site, String hour) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.16:3306/kopoctc", "root", "kopoctc");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from MusicTB where musSite = \"" + site + "\" and date = \"" + time + "\" and gethour = \"" + hour + "\" order by ranking;");
		List<Music> showMusic = new ArrayList<Music>();
		while (rset.next()) {
			Music music = new Music();
			music.setRanking(rset.getInt(1));
			music.setMusSite(rset.getString(2));
			music.setDate(rset.getString(3));
			music.setHour(rset.getString(4));
			music.setMusTitle(rset.getString(5));
			music.setSinger(rset.getString(6));
			showMusic.add(music);
		}
		rset.close();
		stmt.close();
		conn.close();
		return showMusic;
	}

}
