package org.mini.movie.service;

import java.util.List;

import org.mini.domain.Comment;
import org.mini.dto.Criteria;

public interface CommentService {

	public void register(Comment vo);
	public Comment get(Long cno);
	public void modify(Comment vo);
	public void remove(Integer cno);
	public List<Comment> getList(Criteria cri);
	public void moveread(String keyword);
	
}
