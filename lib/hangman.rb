#classes and methods go here

class String
    def is_letters?
        self.downcase.gsub(/[^a-z]/,"") == self.downcase
    end
end

class Hangman
    attr_reader :gameover

    public
    def initialize
        @answer = generate_answer()
        @unguessed_letters = ('A'..'Z').to_a
        @guessed_letters = []
        @penalties = 0
        @gameover = false
    end

    def welcome_message
        system "clear"
        puts "     HANGMAN       "
        puts ""
        puts "Welcome to Hangman!"
        puts ""
        puts "You will be presented with a secret code."
        puts "To play, simply guess a single letter at a time."
        puts "If the letter you guessed is in the code, you will"
        puts "be shown the position of the guessed letter. If the"
        puts "letter you guessed is not in the code, you will move"
        puts "one step closer to EXECUTION! If you reach six"
        puts "incorrect guesses, you will be executed for murder"
        puts "or piracy or whatever. GOOD LUCK!"
        puts ""
        puts "Press ENTER to begin"
        gets.chomp
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

    def next_round
        show_board
        puts "Guess a Letter"
        is_valid_guess = false
        while is_valid_guess != true do
            guess = gets.chomp
            is_valid_guess = validate_guess(guess)
            puts "Invalid guess. Enter a single Letter A - Z" if !is_valid_guess 
        end
        gets.chomp
    end
    
    private
    
    def validate_guess(guess)
        return guess == "" || guess.length > 1 || !guess.is_letters? ? false : true
    end
    
    def check_guess
    end

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

#gameflow

hm = Hangman.new
hm.welcome_message
while !hm.gameover do
    hm.next_round
end