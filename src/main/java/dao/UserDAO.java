package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import config.FactoryProvider;
import entity.Product;
import entity.User;

public class UserDAO 
{
   public static int save(User user)
   {
	   int id=0;
	   Session hibernatesession=null;
	   Transaction trx;
	   try {
		    hibernatesession=FactoryProvider.getFactory().openSession();
		   trx=hibernatesession.beginTransaction();
		    id= (int)hibernatesession.save(user);
		    trx.commit();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }finally {
		   hibernatesession.close();
	   }
	   return id;
   }
   
   public static List<User> getAllUser()
	{
		List<User> list=null;
		 Session hibernatesession=null;
		 try {
			    hibernatesession=FactoryProvider.getFactory().openSession();
			    String hql = "from User";
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
   public static User getByEmailAndPassword(String email,String password)
   {
	   User user=null;
	   Session hibernatesession=null;
	   try {
		    hibernatesession=FactoryProvider.getFactory().openSession();
		    String qery="from User where useEmail=: e and userPassword=: p";
		    Query q=hibernatesession.createQuery(qery);
		    q.setParameter("p", password);
		    q.setParameter("e", email);
		    
		    System.out.println(email + "  "+password);
		    
		    user=(User)q.uniqueResult();
		    
		    System.out.println("get ser"+user);
		    
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }finally {
		   hibernatesession.close();
	   }
	   return user;
   }
}
