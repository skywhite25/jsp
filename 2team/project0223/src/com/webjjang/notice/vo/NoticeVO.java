package com.webjjang.notice.vo;

public class NoticeVO {

	private long no;
	private String title;
	private String content;
	private String startDate; // 공지 시작일
	private String endDate; // 공지 종료일
	private String writeDate; // 공지 등록일(최조)
	private String updateDate; // 최종 수정일
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	@Override
	public String toString() {
		return "NoticeVO [no=" + no + ", title=" + title + ", content=" + content + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", writeDate=" + writeDate + ", updateDate=" + updateDate + "]";
	}
	
}
