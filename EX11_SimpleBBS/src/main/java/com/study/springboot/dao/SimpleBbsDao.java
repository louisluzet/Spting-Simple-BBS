package com.study.springboot.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.study.springboot.dto.SimpleBbsDto;

@Repository
public class SimpleBbsDao implements ISimpleBbsDao {
	
	@Autowired
	JdbcTemplate template;

	@Override
	public List<SimpleBbsDto> listDao() {
		System.out.println("listDao");
		String query = "select * from bbs order by id desc";
		List<SimpleBbsDto> dtos = template.query(query, new BeanPropertyRowMapper<SimpleBbsDto>(SimpleBbsDto.class));
		
		return dtos;
	}

	@Override
	public SimpleBbsDto viewDao(String id) {
		System.out.println("viewDao");
		
		String query = "select * from bbs where id = " + id;
		SimpleBbsDto dto = template.queryForObject(query, new BeanPropertyRowMapper<SimpleBbsDto>(SimpleBbsDto.class));
		
		return dto;
	}

	@Override
	public int writeDao(final String writer, final String title, final String content) {
		System.out.println("writeDao");
		String id = "select Max(id) from bbs";
		String maxId = template.queryForObject(id, String.class);
		if (maxId == null) {
			maxId = "0";
		} else {
			maxId = maxId + 1;
		}
		
		String query = 
						"insert into bbs (id, writer, title, content)"
						+ "values(?, ?, ?, ?)";
		return template.update(query, maxId, writer, title, content);
	}

	@Override
	public int deleteDao(String id) {
		System.out.println("deleteDao");
		String query = "delete from bbs where id=?";
		
		return template.update(query, Integer.parseInt(id));
	}
	

}
