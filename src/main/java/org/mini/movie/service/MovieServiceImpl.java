package org.mini.movie.service;

import java.util.List;

import org.mini.domain.Movie;
import org.mini.domain.Report;
import org.mini.domain.ReportList;
import org.mini.dto.Criteria;
import org.mini.movie.mappers.MovieMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class MovieServiceImpl implements MovieService {

   @Autowired
   private MovieMapper mapper;

   
   
   @Override
   public void register(int mcode, String[] rimg, String[] rpath, 
			String[] pName, String[] addr, 
			String title, String content) {
	   
	   mapper.insertReport(title, content, mcode);
	   for(int i = 0; i < rimg.length; i++) {
		   mapper.insertReportImg(rimg[i], rpath[i]);
	   }
	   
		for(int i = 0; i < addr.length; i++) {
			//log.info("주소 : " + addr[i]);
			log.info("zCode : " + mapper.selectZone(addr[i].split(" ")[0]));
			
			putMarkers(pName[i], addr[i], mapper.selectZone(addr[i].split(" ")[0]), mapper.lastRno());
		}
   }
   
   @Override
   public void putMarkers(String pname, String addr, int zcode, int rno) {
       log.info("들어옴???");
       // TODO Auto-generated method stub
       Integer pno = mapper.isExist(addr);
       log.info("pno? " + pno);
       if(pno == null) {
           log.info("들?");
           mapper.putPlace(pname, addr, zcode);
           log.info("1완료");
           mapper.putMarkers(mapper.lastPno(), rno);

       } else {
           mapper.putMarkers(pno, rno);
       }

   }

   @Override
   public Report get(int rno) {
      // TODO Auto-generated method stub
      return null;
   }

   @Override
   public void modify(Report report) {
      // TODO Auto-generated method stub
      
   }

   @Override
   public void remove(int rno) {
      // TODO Auto-generated method stub
      
   }
   
   @Override
   public List<ReportList> getList(Criteria cri, String str) {
      // TODO Auto-generated method stub
      log.info("service str : " + str);
      return mapper.getList(cri, str);
   }

   @Override
   public int getCount(Criteria cri, String str) {
      // TODO Auto-generated method stub
      return mapper.getTotal(cri, str);
   }

   @Override
   public List<Movie> getMovieread(String keyword) {
      log.info("keyword" +keyword);
      return mapper.getMovieread(keyword);
   }

 
   
@Override
public void register(Report report, String[] files, Long rno, String fileName) {
	
	mapper.report(report);
	mapper.addAttach(rno, fileName);
	
	for(int i=0; i< files.length; i++) {
		mapper.addAttach(rno, fileName);
	}
  }

@Override
public List<Report> getAllData() {
	// TODO Auto-generated method stub
	return mapper.getAllData();
}

}