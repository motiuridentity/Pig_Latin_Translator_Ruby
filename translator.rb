def translate(words)
  vowels = ["a", "e", "i", "o", "u"]
  words = words.split
  new1 = ""
 
  words.each do |word|
    rest = "" #rest of the word after consonants
    cons1 = "" #consonants before the word
    upcase = word[0] =~ /[A-Z]/ ? true : false #determines if capitalized
    word.downcase!
   
    word.length.times do |charr|
      if vowels.include?(word[charr])
        rest << word[charr..-1]
        break      
      else
        if word[charr] == "q" && word[charr + 1] == "u"
          cons1 << word[charr] + word[charr + 1]
          word[charr + 1] = "_" #placeholder for the u after a q
        else
          cons1 << word[charr]
        end
      end
    end   
    cons1 = cons1.gsub("_",'')
    final_word = rest + cons1 + "ay"
    final_word[0] = final_word[0].upcase if upcase == true
    new1 << final_word + " "
  end
  new1 = new1[0..-2]
  return new1
end
