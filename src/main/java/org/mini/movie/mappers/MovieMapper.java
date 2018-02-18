package org.mini.movie.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.mini.domain.Movie;
import org.mini.domain.Report;
import org.mini.domain.ReportList;
import org.mini.dto.Criteria;

public interface MovieMapper extends CRUDMapper<Report, Integer> {

	//@Select("select * from tb_report order by rno desc limit #{skip}, #{size}")
	public List<ReportList> getList(@Param("cri")Criteria cri, @Param("search")String search);
	
	//@Select("select count(rno) from tb_report")
	public int getTotal(@Param("cri")Criteria cri, @Param("search")String search);
	
	public void insertReport(@Param("title")String title, @Param("content")String content, @Param("mcode")int mcode);
	public void insertReportImg(@Param("rpath")String rpath, @Param("rimg")String rimg);
	
	//-------------------------------------장소---------------------------
	public int selectZone(@Param("zname")String zname);
	/*
	
	public String selectAddr(@Param("zcode")int zcode, @Param("addr")String addr);
	
	public void insertPlace(@Param("pname")String pname, @Param("addr")String addr, @Param("zcode")int zcode);
	public void insertMarkersNone(@Param("lastIndex")int lastIndex);
	
	public void insertMarkers();
	
	@Select("select LAST_INSERT_ID()")
	public int lastIndex();*/
	
	@Select("select ifnull(max(rno),0) from tb_report")
	public int lastRno();
	
	@Select("select last_insert_id()")
	public int lastPno();

	public Integer isExist(String addr);

	public Integer putPlace(@Param(value="pname")String pname, @Param(value="addr")String addr, @Param(value="zcode")int zcode);

	public void putMarkers(@Param(value="lastPno") int lastPno, @Param(value="rno") int rno);
	//--------------------------------------------------------------------
	
	
	@Select("select * from tb_report")
	public List<Report> getAllData();
	

	@Insert("insert into tb_reportimg (rno, rimg) values ( #{rno}, #{fimeName})")
	public void addAttach(@Param("rno") Long rno, 
			@Param("fileName") String fileName);

	@Insert("insert into tb_report(rtitle , rcontent) value(#{rtitle},#{rcontent})")
	public void report(Report report);
	
	@Select("select mimg ,mtitle, mcode from tb_movie where mtitle like CONCAT('%', #{keyword}, '%')")
	public List<Movie> getMovieread(String keyword);
}
