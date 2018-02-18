package org.java97.web;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mini.location.service.LocationService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DatabaseTest {
	
	@Test
	public void testConnection() throws Exception{
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://192.168.0.61:3306/morip_db";
		String user = "movie";
		String pw = "trip";
		
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, user, pw);
		
		System.out.println(con);
		
		con.close();
		
	}
	
	@Inject
	LocationService service;
	
	@Test
	public void reportTest() throws Exception {
		//service.putMarkers("테스트 장소", "서울 광진구 초밥집", 1, 17);
	}
	
	
}
