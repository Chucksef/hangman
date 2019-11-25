class Hangman
    attr_reader :answer, :unguessed_letters, :guessed_letters

    public
    def initialize
        @answer = generate_answer()
        @unguessed_letters = ('A'..'Z').to_a
        @guessed_letters = []
        @penalties = 0
    end

    def show_board
        system "clear"
        puts ""
        puts "     HANGMAN       "
        puts "         _______"
        puts "        |       |"
        puts @penalties > 0 ? @penalties > 5 ? "        /¯\\     | " : "       /¯\\      |" : "        |       | "
        puts @penalties > 0 ? @penalties > 5 ? "        x_x     | " : "       \\_/      | " : "                | "
        puts @penalties > 1 ? "        |       | " : "                | "
        puts @penalties > 1 ? @penalties > 2 ? @penalties > 3 ? "       /|\\      | " : "       /|       | " : "        |       | " : "                | "
        puts @penalties > 1 ? @penalties > 2 ? @penalties > 3 ? "      / | \\     | " : "      / |       | " : "        |       | " : "                | "
        puts @penalties > 1 ? @penalties > 2 ? @penalties > 3 ? "     /  |  \\    | " : "     /  |       | " : "        |       | " : "                | "
        puts @penalties > 1 ? "        |       | " : "                | "
        puts @penalties > 4 ? @penalties > 5 ? "       / \\      | " : "       /        | " : "                | "
        puts @penalties > 4 ? @penalties > 5 ? "      /   \\     | " : "      /         | " : "                | "
        puts @penalties > 4 ? @penalties > 5 ? "    _/     \\_   | " : "    _/          | " : "                | "
        puts "                | "
        puts "   _____________|_____" 
        puts ""       
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
hm.show_board
puts "Un-Guessed Letters: #{hm.unguessed_letters.join(" ")}"
puts "Guessed Letters: #{hm.guessed_letters.join(" ")}"
