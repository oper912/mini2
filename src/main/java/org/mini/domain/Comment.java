package org.mini.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class Comment {

	private int cno ;
	private double score ;
	private int rno ;
	private Timestamp cregdate ;
	private Date cupdate ;
	private String ccontent ;
	private String id;
	private String userimg;
	
}
