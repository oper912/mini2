package org.mini.location.service;

import java.util.List;

import org.mini.domain.Comment;
import org.mini.domain.Location;
import org.mini.domain.Movie;
import org.mini.domain.Place;
import org.mini.domain.Report;
import org.mini.domain.Zone;

public interface LocationService {
	public List<Movie> getMovies(int pno, int zcode);
	
	public String getPlaceName(int pno);
	
	public List<Place> getPlace(int zcode);
	
	public List<Location> getLocation();
	
	public Zone getZone(int zcode);
	
	public Movie rMovie(int rno);
	
	public List<Place> rMarker(int rno);
	
	public void rCreate(Comment comment);
	
	public List<Comment> rList(int rno);
	
	public void rUpdate(Comment comment);
	
	public void rDelete(int cno);
	
	public Report getReport(int rno);
}
