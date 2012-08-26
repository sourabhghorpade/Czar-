package beans;
public class Demo 
{
    public static final int NO_OF_SYMBOLS=2;
	private static final int NUMBER_OF_SYMBOLS = 4;
    public static void main(String args[])
    {
        Demo demo= new Demo();
        String string = "cout<<\"How are you\">><<\"Hello World\";";
        string=demo.convertToHTML(string);
        System.out.println(string);
    }
    String convertToHTMLSymbols(String string,String characterToBeReplaced,String characterToBeReplaceBy)
	    {
	        String startString,tempString;
	        while(string.contains(characterToBeReplaced))
	        {
	            startString=string.substring(0, string.indexOf(characterToBeReplaced));
	            tempString=string.substring(string.indexOf(characterToBeReplaced)+1,string.length());
	            string = startString + characterToBeReplaceBy + tempString;
	        }
	        return string;
	    }
	 String convertToHTML(String string)
	    {
	        String Symbol[]={"<",">","'","\""};
	        String HTMLSymbol[]={"&lt","&gt","&lsquo","&quot"};
	        for(int i=0;i< NUMBER_OF_SYMBOLS;i++)
	        {
	            string = convertToHTMLSymbols(string,Symbol[i],HTMLSymbol[i]);
	        }
	        return string;
	    }
}