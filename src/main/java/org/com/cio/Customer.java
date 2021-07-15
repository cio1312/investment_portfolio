package org.com.cio;


import javax.persistence.Entity;
import javax.persistence.Id;


import org.springframework.format.annotation.DateTimeFormat;

 
@Entity
public class Customer {
	
	@Id
	String policynumber;
	
	String firstname;

	String lastname;

	String gender;
	
	String  dob;
	
	String title;
	
	int retirmentage;
	
	String productname;
	
	double investmentamount;
	
	 
	    @DateTimeFormat(pattern="dd/MM/yyyy")

	    String  creationdate;
	
	
	    String  effectivedate;
	
	

	@Override
	public String toString() {
		return "Customer [policynumber=" + policynumber + ", firstname=" + firstname + ", lastname=" + lastname
				+ ", gender=" + gender + ", dob=" + dob + ", title=" + title + ", retirmentage=" + retirmentage
				+ ", productname=" + productname + ", investmentamount=" + investmentamount + ", creationdate="
				+ creationdate + ", effectivedate=" + effectivedate + ", payingterm=" + payingterm + "]";
	}

	public String getPolicynumber() {
		return policynumber;
	}

	public void setPolicynumber(String policynumber) {
		this.policynumber = policynumber;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String  getDob() {
		return dob;
	}

	public void setDob(String  dob) {
		this.dob = dob;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getRetirmentage() {
		return retirmentage;
	}

	public void setRetirmentage(int retirmentage) {
		this.retirmentage = retirmentage;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public double getInvestmentamount() {
		return investmentamount;
	}

	public void setInvestmentamount(double investmentamount) {
		this.investmentamount = investmentamount;
	}

	public String  getCreationdate() {
		return creationdate;
	}

	public void setCreationdate(String  creationdate) {
		this.creationdate = creationdate;
	}

	public String  getEffectivedate() {
		return effectivedate;
	}

	public void setEffectivedate(String  effectivedate) {
		this.effectivedate = effectivedate;
	}

	public int getPayingterm() {
		return payingterm;
	}

	public void setPayingterm(int payingterm) {
		this.payingterm = payingterm;
	}

	int payingterm;
}
