package org.mini.movie.service;

import java.util.List;

import org.mini.domain.Comment;
import org.mini.dto.Criteria;
import org.mini.movie.mappers.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.java.Log;

@Log
@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper mapper;
	
	@Override
	public void register(Comment vo) {
		mapper.create(vo);
	}

	@Override
	public Comment get(Long cno) {
		return mapper.read(cno);
	}

	@Override
	public void modify(Comment vo) {
		mapper.update(vo);
	}

	@Override
	public void remove(Integer cno) {
		mapper.delete(cno);
	}

	@Override
	public List<Comment> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public void moveread(String keyword) {
		// TODO Auto-generated method stub
		
	}

}

