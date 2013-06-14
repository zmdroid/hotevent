package com.cold.service.reply;

import java.util.List;

import com.cold.dao.ReplyDao;
import com.cold.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService {
	
	private ReplyDao replyDao;
	
	@Override
	public boolean createNewReply(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		
		return replyDao.insertReply(replyVO)>0;
	}

	@Override
	public List<ReplyVO> getReplyForEventNo(int eventNo) {
		// TODO Auto-generated method stub
		return replyDao.getReplyForEventNo(eventNo);
	}

	public ReplyDao getReplyDao() {
		return replyDao;
	}

	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}
	
}
