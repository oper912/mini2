package org.mini.movie.service;

import java.util.List;

import org.mini.domain.Movie;
import org.mini.domain.Report;
import org.mini.domain.ReportList;
import org.mini.dto.Criteria;

public interface MovieService {



	public void register(int mcode, String[] rImg, String[] rPath, 
										String[] pName, String[] addr, 
										String title, String content);
	
	public Report get(int rno);
	
	public void modify(Report report);
	
	public void remove(int rno);
	
	public List<ReportList> getList(Criteria cri, String search);
	
	public int getCount(Criteria cri, String search);
	
	public List<Movie> getMovieread(String keyword);
	
	public void putMarkers(String pname, String addr, int zcode, int rno);
	
	//test ---------------------------------
	public List<Report> getAllData();

	void register(Report report, String[] files, Long rno, String fileName);
}
