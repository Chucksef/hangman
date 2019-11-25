class Hangman
    attr_reader :answer, :unguessed_letters, :guessed_letters

    public
    def initialize
        @answer = generate_answer()
        @unguessed_letters = ('A'..'Z').to_a
        @guessed_letters = []
    end

    def show_board
    end

    def check_guess
    end

    private
    def generate_answer
        dict = File.open("5desk.txt", "r")
        valid_words = []
        while !dict.eof do
            word = dict.readline.chomp.chomp
            if word.length > 4 && word.length < 13
                valid_words << word
            end
        end
        valid_words[rand(valid_words.length-1)].upcase
    end
end

hm = Hangman.new
puts hm.answer
puts "Un-Guessed Letters: #{hm.unguessed_letters}"
puts "Guessed Letters: #{hm.guessed_letters.to_s}"
