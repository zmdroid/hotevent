package com.cold.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.cold.service.reply.ReplyService;
import com.cold.util.ResponseUtil;
import com.cold.vo.ReplyVO;
import com.opensymphony.xwork2.ActionSupport;

public class ReplyAction extends ActionSupport implements SessionAware {

	/**
	 * 注入回复服务
	 */
	private ReplyService replyService;
	/**
	 * session
	 */
	private Map<String, Object> session;
	/**
	 * 回复VO
	 */
	private ReplyVO replyVO;

	private String result;

	/**
	 * 
	 * 创建一个新事件
	 * 
	 * @author Ming Zhou
	 * @version 1.0
	 * @createtime 2013-5-31 版本 修改者 时间 修改内容
	 * 
	 */
	public void createNewReply() {
		boolean rs = replyService.createNewReply(replyVO);
		if (rs) {
			result = "success";
		} else {
			result = "error";
		}
		ResponseUtil.sendResult(result);
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

	public ReplyVO getReplyVO() {
		return replyVO;
	}

	public void setReplyVO(ReplyVO replyVO) {
		this.replyVO = replyVO;
	}
	
}
