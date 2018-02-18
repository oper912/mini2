package org.mini.service;

import org.mini.domain.Member;
import org.mini.mappers.CommonMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonMapper mapper;
	
	
	@Override
	public Boolean idcheck(String id) {
		
		// 중복된 게 없으면 false 반환
		Boolean result = mapper.idcheck(id) == 0 ? false : true;
		
		return result;
	}

	@Override
	public Boolean nickcheck(String nick) {
		
		// 중복된 게 없으면 false 반환
		 Boolean result = mapper.nickcheck(nick) == 0 ? false : true;
		
		return result;
	}

	@Override
	public void join(Member member) {
		member.setIsadmin(1);
		mapper.join(member);
	}

	@Override
	public Boolean loginTest(String id, String pw) {
		System.out.println("pw" + pw);
		System.out.println("디비" + mapper.loginTest(id));
		
		if(mapper.loginTest(id) != null) {
			if(mapper.loginTest(id).equals(pw)) {
				System.out.println("들어옴");
				return true;
			}
		}
		
		return false;
	}

	@Override
	public void setProfile(String id, String fileName) {
		mapper.setProfile(id, fileName);
		
	}

	@Override
	public String getProfile(String id) {
		return mapper.getProfile(id);
	}

}
