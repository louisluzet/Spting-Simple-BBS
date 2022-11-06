package com.study.springboot.dao;

import java.util.List;

import com.study.springboot.dto.SimpleBbsDto;

// ������ �������̽�
public interface ISimpleBbsDao {
	// ��ȸ
	public List<SimpleBbsDto> listDao();
	
	// �Խñ� �� ����
	public SimpleBbsDto viewDao(String id);
	
	// �ű� �Խñ� �ۼ�
	public int writeDao(String writer, String title, String content);
	
	// �Խñ� ����
	public int deleteDao(String id);
	
}
