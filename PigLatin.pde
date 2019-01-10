public void setup() 
{
	String[] lines = loadStrings("LowellHymn.txt");
	System.out.println("there are " + lines.length + " lines");
	String[][] words = new String[lines.length][];
	for (int i = 0 ; i < lines.length; i++) 
	{
	  words[i] = lines[i].split(" ");
	}
	for(int a = 0; a < words.length; a++){
		for(int b = 0; b < words[a].length; b ++){
			String word = movePunctuation(pigLatin(words[a][b]));
			if(word.length() > 0 && Character.isUpperCase(word.charAt(word.length() - 3))){
				word = word.substring(0,1).toUpperCase() + word.substring(1,word.length() - 3) + word.substring(word.length() -3).toLowerCase();
			}
			print(word);
			print(" ");
		}
		println("");
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
	    if(sWord.toLowerCase().charAt(a) == 'a' || sWord.toLowerCase().charAt(a) == 'e' || sWord.toLowerCase().charAt(a) == 'i' || sWord.toLowerCase().charAt(a) == 'o' || sWord.toLowerCase().charAt(a) == 'u'){
	      return a;
	    }
  }
  return -1;
}

/*public String capitalized(String word){
	int upperCase;
	for(int a = 0; a < word.length(); a ++){
		if(Character.isUpperCase(word.charAt(a))){

		}
	}
}*/

public String movePunctuation(String word){
	for(int a = 0; a < word.length(); a ++){
		if(word.charAt(a) == ',' || word.charAt(a) == '.'){
			return word.substring(0, a) + word.substring(a + 1) + word.substring(a, a + 1);
		}
	}
	return word;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	return sWord.length() == 0 || sWord == " " ? sWord : findFirstVowel(sWord) == -1? sWord + "ay" : findFirstVowel(sWord) == 0? sWord + "way" : sWord.substring(0,2).equals("qu")? sWord.substring(2, sWord.length()) + "qu" + "ay" : sWord.substring(1) + sWord.substring(0,1) + "ay";
}
