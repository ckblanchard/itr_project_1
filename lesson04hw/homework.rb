###############################################################################
#
# Introduction to Ruby on Rails
#
# Lesson 4 homework
#
# Purpose:
#
# Complete the exercises in this file. This assignment will help you to practice
# the basics of Object-Oriented Programming that we learned in Lesson 4.
#
###############################################################################
#
# 1. Review your solution to the Lesson 3 homework. Copy and Paste your solution
#    to this file.
#
# 2. Create a new method called `increment_guess_count` that takes an Integer
#    parameter and increments it by 1.
#

# # Method to increment guess count
# def increment_guess_count(integer)
#   integer += 1
# end

# 3. Create a new method called `guesses_left` that accepts an Integer
#    parameter. Inside of it, write math so that you can tell how many guesses
#    out of 3 that the Player has left. Use this new method in your code to tell
#    the user how many guesses they have left. Make sure to remove your local
#    variable `guesses_left` and use the new method instead.
#

# # Method to determine and tell user how many guesses remain
# def guesses_left(increment_guess_count)
#   guesses_remaining = 3 - integer
# end

# 5. Make sure to comment your code so that you have appropriate documentation
#    for you and for the TAs grading your homework. :-)
#
# 6. EXTRA CREDIT: Use the built in File class to record a log of all the times
#    your secret number game has been played. Record the time the user played,
#    what their guesses were, whether they won or not, and what the secret
#    number was if they didn't guess it correctly.
#
###############################################################################
#
# Student's Solution
#
###############################################################################


# Identify creator and welcome the player
creator_name = "Craig Blanchard"
puts "Welcome to the Secret Number game, created by #{creator_name}."

# Set variables for secret number sampler and messages hash
set_of_numbers = (1..10).to_a
secret_number = set_of_numbers.sample		# replaces secret_number = 6
messages = {win: "You win!", 
            lose: "You lose. The Secret Number was #{secret_number}.",
            too_low: "Sorry, you guessed too low.",
            too_high: "Sorry, you guessed too high."}

# Method to increment guess count, not needed with x.times do |count| approach
# def increment_guess_count(int)
#   int += 1
# end

# Method to determine and tell user how many guesses remain
def guesses_left(int, max_guesses)
  max_guesses - int
end

# Method to print guesses to log_file
# def log_guesses(count, players_guess)
#   if count == 1
#     log_file.write("guess 1: #{players_guess}, guess 2: , guess 3: , win\n")
#   elsif count == 2
#     log_file.write("guess 2: #{players_guess}, guess 3: , win\n")
#   elsif count == 3
#     log_file.write("guess 3: #{players_guess}, win\n")
#   end
# end

# Ask user's name, welcome them and tell them they have 3 guesses
puts "Please enter your name."
user_name = gets.chomp

# Available guesses as variable, later can ask for user input
available_guesses = 3

puts "Hi, #{user_name}! You have #{available_guesses} guesses to guess the Secret Number between 1 and 10."

# Write time and user_name to log_file
log_file = File.new("log_file.txt", "a")
current_time = Time.new
log_file.write("time: " + current_time.strftime("%Y%m%d_%H%M%S").to_s + ", ")   
log_file.write("user name: #{user_name}, ")
log_file.write("secret number: #{secret_number}, ")

# Different way to iterate
available_guesses.times do |count|
  # Variable for guessed_count
  guessed_count = count + 1
  guesses_left = guesses_left(count, available_guesses)
  # Ternary operators to adjust verb tense and plurals
  turns = guessed_count > 1 ? "turns" : "turn"
  guesses_plural = guesses_left > 1 ? "guesses" : "guess"
  # Print how many guesses they have left
  # puts "\nGuesses remaining: #{ guesses_left(count, available_guesses) }"
  puts "You have #{ guesses_left } #{guesses_plural} left."
  players_guess = gets.chomp.to_i

  # write the guesses to log_file => Don't use... fixing spaces for less than 3 guesses
  # log_file.write("guess #{guessed_count}: #{players_guess}, ")

  # Need to decrement number of guesses left
  if secret_number == players_guess
    puts messages[:win]
    puts "You guessed in #{count + 1} #{turns}!"
    # log_file.write("win\n")
    # Attempt at nested if else statement to adjust csv for guess spacing
    if guessed_count == 1
      log_file.write("guess 1: #{players_guess}, guess 2: , guess 3: , win\n")
    elsif guessed_count == 2
      log_file.write("guess 2: #{players_guess}, guess 3: , win\n")
    elsif guessed_count == 3
      log_file.write("guess 3: #{players_guess}, win\n")
    end
    exit
  elsif secret_number > players_guess
    puts messages[:too_low]
    if guessed_count == 1
      log_file.write("guess 1: #{players_guess}, ")
    elsif guessed_count == 2
      log_file.write("guess 2: #{players_guess}, ")
    elsif guessed_count == 3
      log_file.write("guess 3: #{players_guess}, ")
    end
  elsif secret_number < players_guess
    puts messages[:too_high]
    if guessed_count == 1
      log_file.write("guess 1: #{players_guess}, ")
    elsif guessed_count == 2
      log_file.write("guess 2: #{players_guess}, ")
    elsif guessed_count == 3
      log_file.write("guess 3: #{players_guess}, ")
    end
  end
end

# Didn't pick secret number in 3 tries, so print lose message
log_file.write("lose\n")
log_file.close
puts messages[:lose]




