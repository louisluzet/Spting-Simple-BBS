package com.study.springboot.dao;

import java.util.List;

import com.study.springboot.dto.SimpleBbsDto;

// 구현부 인터페이스
public interface ISimpleBbsDao {
	// 조회
	public List<SimpleBbsDto> listDao();
	
	// 게시글 상세 보기
	public SimpleBbsDto viewDao(String id);
	
	// 신규 게시글 작성
	public int writeDao(String writer, String title, String content);
	
	// 게시글 삭제
	public int deleteDao(String id);
	
}
