package entity;

import java.text.NumberFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pID;
	@Column(length = 1500)
	private String pDesc;
	private String pName;
	private String photo;
	private int pPrice;
	private int pDiscount;
	private int pQuantity;
	@ManyToOne
	private Category categories;
	
	
	public Product(int pID, String pDesc,String pName, String photo, int pPrice, int pDiscount, int pQuantity,
			Category categories) {
		super();
		this.pID = pID;
		this.pDesc = pDesc;
		this.pName=pName;
		this.photo = photo;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.categories = categories;
	}
	
	
	public Product() {
		// TODO Auto-generated constructor stub
	}


	public String getpDesc() {
		return pDesc;
	}


	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	

	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public Category getCategories() {
		return categories;
	}


	public void setCategories(Category categories) {
		this.categories = categories;
	}


	public int getpID() {
		return pID;
	}
	public void setpID(int pID) {
		this.pID = pID;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public double getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public double getpDiscount() {
		return pDiscount;
	}
	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}
	public double getpQuantity() {
		return pQuantity;
	}
	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}


	@Override
	public String toString() {
		return "Product [pID=" + pID + ", pDesc=" + pDesc + ", photo=" + photo + ", pPrice=" + pPrice + ", pDiscount="
				+ pDiscount + ", pQuantity=" + pQuantity + "]";
	}
	
	public static double getCalclatedPrice(double price,double discount)
	{
//		NumberFormat nf = NumberFormat.getInstance();
//		nf.setMaximumFractionDigits(3);
			String netprice=String.format("%.2f", price-price*discount/100);
			
			return Double.parseDouble(netprice);
			
		
	}
}
