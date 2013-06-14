package com.cold.service.reply;

import java.util.List;

import com.cold.vo.ReplyVO;

public interface ReplyService {
	boolean createNewReply(ReplyVO replyVO);
	List<ReplyVO> getReplyForEventNo(int eventNo);
}
