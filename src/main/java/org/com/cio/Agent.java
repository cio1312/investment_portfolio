package org.com.cio;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Agent {
	
	@Id
	String agentid;
	String password;
	public String getAgentid() {
		return agentid;
	}
	public void setAgentid(String agentid) {
		this.agentid = agentid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Agent [agentid=" + agentid + ", password=" + password + "]";
	}
	

}