package kopo12.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import kopo12.dao.MusicDao;
import kopo12.dao.MusicDaoImpl;
import kopo12.domain.Music;

public class MusicServiceImpl implements MusicService {
	private MusicDao musicDao = MusicDaoImpl.getInstance();
	private static MusicServiceImpl instance = new MusicServiceImpl();		//for singleton
	
	private MusicServiceImpl() {	//constructor for sigleton
		
	}
	
	public static MusicServiceImpl getInstance() {		//singleton method
		return instance;
	}
	
	@Override
	public void create(List<List<String>> List) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Music selectOne(int id) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Music> selectAll(String time, String site) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return musicDao.selectAll(time, site);
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
	public ArrayList<String> hourList(String time, String site) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		ArrayList<String> realList = new ArrayList<String>(); 
		HashSet<String> hourList = new HashSet<String>();
		List<Music> musicList = instance.selectAll(time, site);
		for(Music music : musicList) {
			hourList.add(music.getHour());
		}
		Iterator it= hourList.iterator();
		while(it.hasNext()){
			realList.add((String) it.next());
		}
		return realList;
	}

	@Override
	public List<Music> selectAll(String time, String site, String hour) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return musicDao.selectAll(time, site, hour);
	}

}
