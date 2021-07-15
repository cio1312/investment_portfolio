package org.com.cio;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


@Controller
@SessionAttributes("agentid")
public class investmentControl {
	static int a1=1;
	static String aid;
	static String pg;
	
	@Autowired
	investmentDao dao;
	
	@Autowired
	customerdao customerdao;
	
	
	@RequestMapping("login")
	public String login() {	
		return "login.jsp";
	}
	
	
	@RequestMapping("Home")
	public ModelAndView home(@RequestParam("policynumber") String policynumber) {	
		 ModelAndView mv = new ModelAndView();
		 
		 System.out.println("page in home=" +pg);
		 if(pg.equals("home")) {
		 mv.addObject("customer",customerdao.findAll());
		 mv.addObject("agentid",aid);
		 mv.setViewName("home.jsp");
	      System.out.println(aid);
		return mv;}
		 if(pg.equals("details")){ 
			 pg="home";
			Customer customer = new Customer();
	        customer=customerdao.findByPolicynumber(policynumber); 
	        mv.addObject("customer",customer);
			 mv.addObject("agentid",aid);
			 mv.setViewName("details.jsp");
			 return mv;
		}
		 mv.addObject("customer",customerdao.findAll());
		 mv.addObject("agentid",aid);
		 mv.setViewName("home.jsp");
	      System.out.println(aid);
		return mv;
	}
	
	
		
	@RequestMapping("checklogin")
	public ModelAndView checklogin(@RequestParam("agentID") String agentid, @RequestParam("password") String password) {
    ModelAndView mv = new ModelAndView();	 
	Agent c=dao.findByAgentidAndPasswod(agentid,password);
	if(c== null) {
		System.out.println("invalid login credintials");
		mv.addObject("status","Invalid Credentials");
		mv.setViewName("login");
		return mv;
	}
	
	System.out.println("user customerid="+ agentid);
	System.out.println("databse customerid="+ c.agentid);
	
	if(c.agentid.equals(agentid)) {
		System.out.println("successful login");
		aid=agentid;
		int k=10;
		List<Customer> ck= customerdao.findAll();
		if(ck.isEmpty()) {mv.addObject("key",0);k=0;}else {mv.addObject("key",1);k=1;}
		  System.out.println("value due to database="+k);
		mv.addObject("status","");	
		mv.addObject("customer",customerdao.findAll());
	    mv.addObject("agentid",aid);
		mv.setViewName("home.jsp");
		return mv;
	}
	else {
		System.out.println("invalid login credintials");
		mv.addObject("status","login failed");
		mv.setViewName("login");
		return mv;}
	}
	
	
	@RequestMapping("customerinvestmentportfolio")
	public String customerinvestmentportfolio() {	
		return "addproposal.jsp";
	}
	
	@RequestMapping("search")
	public ModelAndView searching(
			@RequestParam("policynumber")String policynumber,
			@RequestParam("firstname")String firstname,
			@RequestParam("lastname") String lastname) {	
		
	    ModelAndView mv = new ModelAndView();
	    
		int k=10;
		List<Customer> cs= customerdao.findByCustomeridAndFirstnameAndLastname(policynumber, firstname, lastname);
		if(cs.isEmpty()) {mv.addObject("key",0);k=0;}else {mv.addObject("key",1);k=1;}
		
		  System.out.println("value due to database="+k);
	    System.out.println("value due to search="+k);
	    System.out.println(customerdao.findByCustomeridAndFirstnameAndLastname(policynumber, firstname, lastname)); 	 
		mv.addObject("status","");
		mv.addObject("customer",customerdao.findByCustomeridAndFirstnameAndLastname(policynumber, firstname, lastname));
		mv.addObject("agentid",aid);
		mv.setViewName("home.jsp");
		return mv;
	}
	

	@RequestMapping("savenewproposal")
	public ModelAndView savenewproposal(
			@RequestParam("productname") String productname,@RequestParam("investmentamount") int investmentamount,
			@RequestParam("creationdate")String creationdate,
			@RequestParam("effectivedate")String  effectivedate,
			@RequestParam("title") String title,@RequestParam("firstname") String firstname,
	        @RequestParam("lastname") String lastname,@RequestParam("dob")String dob1,
	        @RequestParam("gender") String gender,@RequestParam("retirementage") int retirementage)throws ParseException{	
		
		

		ModelAndView mv = new ModelAndView();
		
		// validation
		if(lastname.length()<5 || lastname.length()>12) {
			mv.addObject("status","Invalid Details");	
			mv.addObject("customer",customerdao.findAll());
		    mv.addObject("agentid",aid);
			mv.setViewName("addproposal.jsp");
			return mv;
			
		}
		if(firstname.length()<5 || firstname.length()>12) {
			mv.addObject("status","Invalid Details");	
			mv.addObject("customer",customerdao.findAll());
		    mv.addObject("agentid",aid);
			mv.setViewName("addproposal.jsp");
			return mv;
		}
		
if(!firstname.matches("\\w+")) {
	mv.addObject("status","Invalid Details");	
	mv.addObject("customer",customerdao.findAll());
    mv.addObject("agentid",aid);
	mv.setViewName("addproposal.jsp");
	return mv;
}

if(!lastname.matches("\\w+")) {
	mv.addObject("status","Invalid Details");	
	mv.addObject("customer",customerdao.findAll());
    mv.addObject("agentid",aid);
	mv.setViewName("addproposal.jsp");
	return mv;
}


if(productname.isEmpty() || gender.isEmpty() || title.isEmpty() || firstname.isEmpty() || lastname.isEmpty() || creationdate.isEmpty() || dob1.isEmpty() || effectivedate.isEmpty()) {
	mv.addObject("status","Invalid Details");	
	mv.addObject("customer",customerdao.findAll());
    mv.addObject("agentid",aid);
	mv.setViewName("addproposal.jsp");
	return mv;
}


        Customer c = new Customer();
        c.productname=productname;
        c.investmentamount=investmentamount;
        c.creationdate=creationdate;
        c.effectivedate=effectivedate;
        c.title=title;
        c.firstname=firstname;
        c.lastname=lastname;
        c.dob=dob1;
        c.gender=gender; 
        c.retirmentage=retirementage;
          
         
     String str = String.format("%08d", a1);
     String a2="INS";
     String a4= a2.concat(str);
        c.policynumber=a4;
     
     a1=a1+1;
    
     
     DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
     LocalDate dob = LocalDate.parse(dob1, formatter);
     int currentage=Math.abs((dob.getYear()-Calendar.getInstance().get(Calendar.YEAR)));
     System.out.println("age= "+currentage);
     int premiumpayingterm = retirementage-currentage;
     System.out.println("premiumpayingterm= "+premiumpayingterm);
     c.payingterm=premiumpayingterm;
      
     customerdao.save(c);
     
	mv.addObject("status","");	
	System.out.println(customerdao.findAll());
	mv.addObject("customer",customerdao.findAll());
	System.out.println(customerdao.findAll());
	 mv.addObject("agentid",aid);
	mv.setViewName("home.jsp");
	
     
		return mv;
	}
	

	@RequestMapping("customerdetails")
	public ModelAndView customerdetails(@RequestParam("type") String type,@RequestParam("policynumber") String policynumber,@RequestParam("wpage") String wpage){
		
		pg=wpage;
        String page = null;
        ModelAndView mv = new ModelAndView(page);
        Customer customer = new Customer();
        customer=customerdao.findByPolicynumber(policynumber); 
        
		if(type.equals("details"))
		{page= "details.jsp";}
		
		
		if(type.equals("illustrate"))
		{page= "illustrate.jsp";
		if(customer.productname.equals("product1")) {
			
			double YearlyGrowthValue = (customer.investmentamount * 0.062) + customer.investmentamount;
			   
			double	temp = YearlyGrowthValue + (1*YearlyGrowthValue*0.03);
			
			int YearlyProductFundValue = (int)temp;
			
			int n =customer.payingterm;
			int[] table = new int[n];
			table[0]=YearlyProductFundValue;
			
			for(int i=1 ;i<n;i++) {
			    YearlyGrowthValue = (table[i-1] * 0.062) + table[i-1];
				
			    System.out.println(YearlyGrowthValue);
			    
			    temp = YearlyGrowthValue + ((i+1)*YearlyGrowthValue*0.03);
				
				YearlyProductFundValue = (int)temp;
			
				table[i]=YearlyProductFundValue-1;
				}
			    mv.addObject("term",n);
                 mv.addObject("table",table);
                 }
		
		
		
		if(customer.productname.equals("product2")) {
		double YearlyGrowthValue = (customer.investmentamount * 0.038) + customer.investmentamount;
		   
		double	temp = YearlyGrowthValue + (1*YearlyGrowthValue*0.06);
		
		int YearlyProductFundValue = (int)temp;
		
		int n =customer.payingterm;
		int[] table = new int[n];
		table[0]=YearlyProductFundValue;
		
		for(int i=1 ;i<n;i++) {
		    YearlyGrowthValue = (table[i-1] * 0.038) + table[i-1];
			   
		    temp = YearlyGrowthValue + ((i+1)*YearlyGrowthValue*0.06);
			
			YearlyProductFundValue = (int)temp;
		
			table[i]=YearlyProductFundValue;
			}	
             mv.addObject("table",table);
             mv.addObject("term",n);	
		} 
			
		}
		mv.addObject("customer",customer);
		mv.setViewName(page);
					
		
	
		return mv;
	}	


}
