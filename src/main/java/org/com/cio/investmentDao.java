package org.com.cio;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface investmentDao extends JpaRepository<Agent,Integer>{
	
	@Query("FROM Agent  WHERE agentid =?1 AND password = ?2")
    Agent findByAgentidAndPasswod(String agentid, String password);
	

}
