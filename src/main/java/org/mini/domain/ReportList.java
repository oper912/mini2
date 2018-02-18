package org.mini.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReportList {
	private int rno;
	private String rtitle;
	private String rcontent;
	private Date rregdate;
	private Date rupdate;
	private int mcode;
	private String id ;
	
	private int rimgno ;
	private String rpath ;
	private String rimg ;
}
