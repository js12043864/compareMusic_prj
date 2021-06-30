package kopo12.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kopo12.domain.Music;

public interface MusicService {
	void create(List<List<String>> List);
	Music selectOne(String time, String site, String hour, String keyWord) throws SQLException, ClassNotFoundException;	
	List<Music> selectAll(String time, String site) throws SQLException, ClassNotFoundException;
	void update();
	void delete(Music music);
	ArrayList<String> hourList(String time, String site) throws ClassNotFoundException, SQLException;
	List<Music> selectAll(String time, String site, String hour) throws SQLException, ClassNotFoundException;
}
