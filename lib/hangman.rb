def generate_answer
    dict = File.open("5desk.txt", "r")
    valid_words = []
    while !dict.eof do
        word = dict.readline.chomp.chomp
        if word.length > 4 && word.length < 13
            puts "#{word}: length = #{word.length}"
            valid_words << word
        end
    end
    valid_words[rand(valid_words.length-1)].upcase
end



answer = generate_answer()
