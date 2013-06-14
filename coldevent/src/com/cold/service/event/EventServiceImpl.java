package com.cold.service.event;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cold.dao.EventDao;
import com.cold.vo.EventVO;

public class EventServiceImpl implements EventService {

	
	private EventDao eventDao;
	
	@Override
	public boolean createNewEvent(EventVO eventVO) {
		// TODO Auto-generated method stub
		try {
			return eventDao.insertEvent(eventVO)>0;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean modifyEvent(EventVO eventVO) {
		// TODO Auto-generated method stub
		try {
			return eventDao.modifyEvent(eventVO)>0;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public EventVO getEventBYEventNo(int eventNo) {
		// TODO Auto-generated method stub
		try {
			return eventDao.getEventByEventNo(eventNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<EventVO> getEventsByAuthor(int author) {
		// TODO Auto-generated method stub
		try {
			return eventDao.getEventsByAuthor(author);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<EventVO> getEventsByDate(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		try {
			return eventDao.getEventsByYear(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public EventDao getEventDao() {
		return eventDao;
	}

	public void setEventDao(EventDao eventDao) {
		this.eventDao = eventDao;
	}
	

}
