package org.mini.movie.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.mini.domain.Comment;
import org.mini.dto.Criteria;

public interface CommentMapper extends CRUDMapper<Comment ,Integer> {


	@Select("select * from tb_report order by rno desc limit #{skip}, #{size}")
	public List<Comment> getList(Criteria cri);

	@Select("select c.cno ,c.ccontent, c.cupdate ,ci.cimg from tb_report r , tb_comment c , tb_commentimg ci where r.rno = #{c.rno} and c.cno = #{ci.cno}")
	public Comment read(Long cno);



}
