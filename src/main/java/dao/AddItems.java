package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import config.FactoryProvider;
import entity.Category;
import entity.Product;

public class AddItems
{
	public static int saveCategoris(Category cat)
	   {
		   int id=0;
		   Session hibernatesession=null;
		   Transaction trx;
		   try {
			    hibernatesession=FactoryProvider.getFactory().openSession();
			   trx=hibernatesession.beginTransaction();
			    id= (int)hibernatesession.save(cat);
			    trx.commit();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }finally {
			  
			   hibernatesession.close();
		   }
		   return id;
	   }
	   
	public static List<Category> getAllCategory()
	{
		List<Category> list=null;
		 Session hibernatesession=null;
		 try {
			    hibernatesession=FactoryProvider.getFactory().openSession();
			    String hql = "from Category";
			    Query query = hibernatesession.createQuery(hql);
			    list= query.getResultList();
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }finally {
			  
			   hibernatesession.close();
		   }
		return list;
	}
	
	public static Category getCategoryById(int id)
	{
		Category cat=null;
		 Session hibernatesession=null;
		 try {
			    hibernatesession=FactoryProvider.getFactory().openSession();
			    cat=hibernatesession.get(Category.class, id);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }finally {
			  
			   hibernatesession.close();
		   }
		return cat;
	}
	public static int saveProduct(Product product)
	   {
		   int id=0;
		   Session hibernatesession=null;
		   Transaction trx;
		   try {
			    hibernatesession=FactoryProvider.getFactory().openSession();
			   trx=hibernatesession.beginTransaction();
			    id= (int)hibernatesession.save(product);
			    trx.commit();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }finally {
			  
			   hibernatesession.close();
		   }
		   return id;
	   }
	
	public static List<Product> getAllProduct()
	{
		List<Product> list=null;
		 Session hibernatesession=null;
		 try {
			    hibernatesession=FactoryProvider.getFactory().openSession();
			    String hql = "from Product";
			    Query query = hibernatesession.createQuery(hql);
			    list= query.getResultList();
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }finally {
			  
			   hibernatesession.close();
		   }
		return list;
	}
	public static List<Product> getAllProductById(String id)
	{
		List<Product> list=null;
		 Session hibernatesession=null;
		 try {
			    hibernatesession=FactoryProvider.getFactory().openSession();
			    String hql = "from Product as p where p.categories.categoryID=:cid";
			    Query query = hibernatesession.createQuery(hql);
			    query.setParameter("cid",Integer.parseInt(id) );
			    list= query.getResultList();
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }finally {
			  
			   hibernatesession.close();
		   }
		return list;
	}
	
	
	
	
}
