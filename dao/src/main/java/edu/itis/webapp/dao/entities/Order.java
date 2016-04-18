package edu.itis.webapp.dao.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "\"ORDER\"")
public class Order implements GenericEntity{

	@Id
    @Column(name = "id")
	public Long id;

    @Column(name = "customerId")
	public Integer customerId;

    @Column(name = "salesPersonId")
	public Integer salesPersonId;

	@Override
	public Long getId() {
		return id;
	}

	@Override
	public void setId(Long id) {
		this.id = id;
	}
	
	public Integer getCustomerId() {
		return customerId;
	}
	
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	
	public Integer getSalesPersonId() {
		return salesPersonId;
	}
	
	public void setSalesPersonId(Integer salesPersonId) {
		this.salesPersonId = salesPersonId;
	}
	
	@Override
	public String toString() {
		StringBuilder  sb = new StringBuilder();
		sb.append(id);
		sb.append(" " + customerId);
		sb.append(" " + salesPersonId);
		return sb.toString();
	}
	
	
}
