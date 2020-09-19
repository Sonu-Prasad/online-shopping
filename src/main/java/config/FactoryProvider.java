package config;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
public class FactoryProvider
{
	 private static SessionFactory factory;
	  public static SessionFactory getFactory()
	  {
		  try {
	          if(factory==null){
	        	  System.out.println("bfjejwgjej");
	              factory=new Configuration().configure("config/hibernate.cfg.xml").buildSessionFactory();
	          }
	          
	      } catch (Exception e) {
	          e.printStackTrace();
	      }
		  return factory;
	  }
}
