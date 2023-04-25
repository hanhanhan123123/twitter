package data;

import java.util.Date;

public class Tweet {
	String code;
	String writer;
	String body;
	Date writed;
	
	//writer추가 정보를 join으로 얻을때를 대비해서 만들어둠
	String wirerNick;
	String writerImg;
	
	//setter, getter 추가
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public Date getWrited() {
		return writed;
	}
	public void setWrited(Date writed) {
		this.writed = writed;
	}
	public String getWirerNick() {
		return wirerNick;
	}
	public void setWirerNick(String wirerNick) {
		this.wirerNick = wirerNick;
	}
	public String getWriterImg() {
		return writerImg;
	}
	public void setWriterImg(String writerImg) {
		this.writerImg = writerImg;
	}
	
	
	
}
