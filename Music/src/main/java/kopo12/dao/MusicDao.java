package kopo12.dao;

import java.sql.SQLException;
import java.util.List;

import kopo12.domain.Music;

public interface MusicDao {
	void create(List<List<String>> List) throws SQLException, ClassNotFoundException;
	Music selectOne(int id) throws SQLException, ClassNotFoundException;	
	void update();
	void delete(Music music);
	List<Music> selectAll(String time, String site) throws SQLException, ClassNotFoundException;
	List<Music> selectAll(String time, String site, String hour) throws SQLException, ClassNotFoundException;
}
