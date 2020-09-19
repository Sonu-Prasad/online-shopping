package entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class Category
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryID;
	private String categoryTitle;
	private String categoriesDescription;
	
	@OneToMany(mappedBy = "categories" ,fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Product> product=new ArrayList<>();
	
	
	
	public Category(int categoryID, String categoryTitle, String categoriesDescription, List<Product> product) {
		super();
		this.categoryID = categoryID;
		this.categoryTitle = categoryTitle;
		this.categoriesDescription = categoriesDescription;
		this.product = product;
	}

	public Category() {
		// TODO Auto-generated constructor stub
	}


	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}
	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	public String getcategoriesDescription() {
		return categoriesDescription;
	}
	public void setcategoriesDescription(String categoriesDescription) {
		this.categoriesDescription = categoriesDescription;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Category [categoryID=" + categoryID + ", categoryTitle=" + categoryTitle + ", categoriesDescription="
				+ categoriesDescription + ", product=" + product + "]";
	}

	
}
