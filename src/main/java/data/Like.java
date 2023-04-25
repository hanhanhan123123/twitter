package data;

import java.util.Date;

public class Like {
	String code;
	String owner;
	String target;
	Date likes;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	
	
	public String getTarget() {
		return target;
	}


	
	public Date getLikes() {
		return likes;
	}
	public void setLikes(Date likes) {
		this.likes = likes;
	}
	
	
}
