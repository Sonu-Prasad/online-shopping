package helper;

public class DescModify

{
	public static String getModify10words(String desc)
	{
		String words[]=desc.split(" ");
		String str="";
		
		if(words.length>10)
		{
			for(int i=0;i<10;i++)
			{
				str=str+words[i]+" ";
			}
			str=str+"...";
			
			return str;
		}else {
			return desc+"...";
		}
	}
}
