package com.cold.dao;

import java.util.List;

import com.cold.vo.ReplyVO;

public interface ReplyDao {
	int insertReply(ReplyVO replyVO);
	List<ReplyVO> getReplyForEventNo(int eventNo);
}
