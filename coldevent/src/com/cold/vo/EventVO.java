package com.cold.vo;

public class EventVO {
	
	/**
	 *  `eventNo` int(11) NOT NULL AUTO_INCREMENT,
  `author` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `startTime` datetime NOT NULL,
  `createTime` datetime NOT NULL,
  `cause` varchar(1200) DEFAULT NULL,
  `after` varchar(1200) DEFAULT NULL,
  `result` varchar(1200) DEFAULT NULL,
  `state` int(11) NOT NULL,
	 */
	private int eventNo;//事件编号
	private int author; //发布人编号
	private String name; //事件名称
	private String startTime;//事件的开始时间
	private String createTime;//事件的创建时间
	private String cause;//事件的起因
	private String after;//事件的经过
	private String result;//事件的结果
	private int state;//事件的状态，0:事件进行中，1:事件已经结束
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public int getAuthor() {
		return author;
	}
	public void setAuthor(int author) {
		this.author = author;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public String getAfter() {
		return after;
	}
	public void setAfter(String after) {
		this.after = after;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "eventNo="+this.eventNo+" name"+this.name+" startName"+this.startTime;
	}
}
