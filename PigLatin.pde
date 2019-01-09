public void setup() 
{
	String[] lines = loadStrings("LowellHymn.txt");
	System.out.println("there are " + lines.length + " lines");
	String[][] words = new String[lines.length][];
	for (int i = 0 ; i < lines.length; i++) 
	{
	  words[i] = lines[i].split(" ");
	  println(words[i]);
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	for(int a = 0; a < sWord.length(); a++){
	    if(sWord.charAt(a) == 'a' || sWord.charAt(a) == 'e' || sWord.charAt(a) == 'i' || sWord.charAt(a) == 'o' || sWord.charAt(a) == 'u'){
	      return a;
	    }
  }
  return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	return findFirstVowel(sWord) == -1? sWord + "ay" : findFirstVowel(sWord) == 0? sWord + "way" : sWord.substring(0,2).equals("qu")? sWord.substring(2, sWord.length()) + "qu" + "ay" : sWord.substring(1) + sWord.substring(0,1) + "ay";
}
