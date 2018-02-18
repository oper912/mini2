package org.mini.web;

import java.util.List;

import org.mini.domain.Comment;
import org.mini.location.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	LocationService service;
	
	@GetMapping("/list")
	public List<Comment> list(int rno){
		
		return service.rList(rno);
	}
	
	@PostMapping("/register")
	public ResponseEntity<String> register(Comment comment) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.rCreate(comment);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PutMapping("/update")
	public ResponseEntity<String> update(@RequestBody Comment comment) {
		System.out.println(comment);
		ResponseEntity<String> entity = null;
		
		try {
			service.rUpdate(comment);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@DeleteMapping("/delete/{cno}")
	public ResponseEntity<String> delete(@PathVariable("cno") int cno) {
		ResponseEntity<String> entity = null;
		
		try {
			service.rDelete(cno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}














