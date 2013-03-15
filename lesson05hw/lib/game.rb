class Game
attr_accessor :current_guess
attr_reader :guesses_allowed, :current_guess_count, :set_of_numbers, :secret_number

# Class variable containing hash of result messages
@@messages = {win: "You win!", 
              lose: "You lose.",
              too_low: "Sorry, you guessed too low.",
              too_high: "Sorry, you guessed too high."}

  # initialize variables, create a new secret number and a new player
  def initialize(set_of_numbers = 1..10, guesses_allowed = 3, current_guess_count = 0)
    @guesses_allowed = guesses_allowed
    @set_of_numbers = set_of_numbers
    @current_guess_count = current_guess_count
    @player = Player.new(@name, @current_guess_count)
    @secret_number = SecretNumber.new
    @current_guess = nil
  end

  # method to increment @current_guess_count and decrement @guesses_allowed
  def increment_guess_count
    @current_guess_count += 1
    @guesses_allowed -= 1
  end

  # Method to test player's guess
  def guess_correct?(guess)
    # logic to adjust plural and verb tense
    turns = @current_guess_count > 1 ? "turns" : "turn"

    # Begin testing player's guess against secret number
    if guess == @secret_number.secret_number
      puts @@messages[:win]
      puts "You guessed in #{@current_guess_count} #{turns}!"
      return true
      exit
    elsif guess > @secret_number.secret_number
      puts @@messages[:too_high]
      # puts "You have " + @guesses_allowed.to_s + " guesses left."
      return false
    elsif guess < @secret_number.secret_number
      puts @@messages[:too_low]
      # puts "You have " + @guesses_allowed.to_s + " guesses left."
      return false
    end     
  end

  # method to identify game creator
  def print_created_by
    creator_name = "Craig Blanchard"
    puts "Welcome to the Secret Number game, created by #{creator_name}."
  end

  # method that organizes game methods and controls loop
  def start_game
    # Call print_created_by method to credit creator
    print_created_by
    # ask for user's name and get input
    puts "Please enter your name."
    @player.name = gets.chomp
    puts "Hi, #{@player.name}! You have #{guesses_allowed} chances to guess the secret number between 1 and 10."
    # Begin loop
    @guesses_allowed.times do
      if @current_guess_count == 0
        puts "Please make a guess."
      else
        guesses_plural = @guesses_allowed > 1 ? "guesses" : "guess"
        puts "You have " + @guesses_allowed.to_s + " #{guesses_plural} left."
      end
      @current_guess = gets.chomp.to_i
      increment_guess_count
      if guess_correct?(@current_guess)
        puts "Thank you for playing the game!"
        exit
      end
    end

    # Player failed to guess correctly in allotted guess amount
    # Print lose message
    puts @@messages[:lose]
    puts "The secret number was #{@secret_number.secret_number}. Thank you for playing."
  end

end





