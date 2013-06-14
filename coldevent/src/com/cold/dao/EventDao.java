package com.cold.dao;

import java.util.List;
import java.util.Map;

import com.cold.vo.EventVO;

public interface EventDao {

	int insertEvent(EventVO eventVO) throws Exception;
	
	EventVO getEventByEventNo(int eventNo) throws Exception;
	
	List<EventVO> getEventsByAuthor(int author) throws Exception;
	
	List<EventVO> getEventsByYear(Map map) throws Exception;
	
	int modifyEvent(EventVO eventVO) throws Exception;
}
