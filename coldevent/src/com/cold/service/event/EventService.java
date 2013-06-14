package com.cold.service.event;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.cold.vo.EventVO;

public interface EventService {
	
	boolean createNewEvent(EventVO eventVO);

	boolean modifyEvent(EventVO eventVO);
	
	EventVO getEventBYEventNo(int eventNo);

	List<EventVO> getEventsByAuthor(int author);
	
	List<EventVO> getEventsByDate(Date startDate, Date endDate);
}
