package com.cold.action;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.SessionAware;

import com.cold.consts.Consts;
import com.cold.service.event.EventService;
import com.cold.service.reply.ReplyService;
import com.cold.util.Convert;
import com.cold.util.DateType;
import com.cold.util.ResponseUtil;
import com.cold.vo.EventVO;
import com.cold.vo.ReplyVO;
import com.opensymphony.xwork2.ActionSupport;

public class EventAction extends ActionSupport implements SessionAware {

	/**
	 * 注入事件服务
	 */
	private EventService eventService;
	private ReplyService replyService;
	/**
	 * session
	 */
	private Map<String, Object> session;
	/**
	 * 事件VO
	 */
	private EventVO eventVO;
	private List<ReplyVO> replys;

	/**
	 * 事件编号
	 */
	private int eventNo;
	private List<EventVO> events;

	private String result;

	/**
	 * 开始年月日（2013-1-1）
	 */
	private String date;

	/**
	 * 作者Id
	 */
	private int author;

	/**
	 * 
	 * 创建一个新事件
	 * 
	 * @author Ming Zhou
	 * @version 1.0
	 * @createtime 2013-5-31 版本 修改者 时间 修改内容
	 * 
	 */
	public void createNewEvent() {
		eventVO.setAuthor(1);
		eventVO.setCreateTime((new Date()).toLocaleString());
		boolean rs = eventService.createNewEvent(eventVO);
		if (rs) {
			result = "success";
		} else {
			result = "error";
		}
		ResponseUtil.sendResult(result);

	}

	/**
	 * 
	 * 修改事件
	 * 
	 * @author Ming Zhou
	 * @version 1.0
	 * @createtime 2013-5-31 版本 修改者 时间 修改内容
	 * 
	 */
	public void updateEvent() {
		boolean rs = eventService.modifyEvent(eventVO);
		if (rs) {
			result = "success";
		} else {
			result = "error";
		}
		ResponseUtil.sendResult(result);
	}

	public String getEventByEventNo() {
		eventVO = eventService.getEventBYEventNo(eventNo);
		replys = replyService.getReplyForEventNo(eventNo);
		if(eventVO==null){return ERROR;}
		return SUCCESS;
	}

	/**
	 * 
	 * 根据年份获取该年的事件List
	 * 
	 * @author Ming Zhou
	 * @version 1.0
	 * @createtime 2012-5-22 版本 修改者 时间 修改内容
	 * 
	 */
	public void getEventsByYear() {
		Date startDate = Convert.stringToDate(date, DateType.YMD);
		Calendar cal = Calendar.getInstance();
		cal.setTime(startDate);
		cal.add(Calendar.YEAR, 1);
		Date endDate = cal.getTime();
		events = eventService.getEventsByDate(startDate, endDate);
		result = JSONArray.fromObject(new Object[]{events, date}).toString();
		ResponseUtil.sendResult(result);
	}

	public void getEventsByAuthor() {

		List<EventVO> events = eventService.getEventsByAuthor(author);
		JSONArray jArray = new JSONArray();
		jArray.add(events);
		result = jArray.toString();
		ResponseUtil.sendResult(result);

	}

	public EventService getEventService() {
		return eventService;
	}

	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}
	
	public ReplyService getReplyService() {
		return replyService;
	}

	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub

	}

	public EventVO getEventVO() {
		return eventVO;
	}

	public void setEventVO(EventVO eventVO) {
		this.eventVO = eventVO;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getAuthor() {
		return author;
	}

	public void setAuthor(int author) {
		this.author = author;
	}
	
	

}
