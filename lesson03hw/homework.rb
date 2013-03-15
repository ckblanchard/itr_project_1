###############################################################################
#
# Introduction to Ruby on Rails
#
# Homework 03
#
# Purpose:
#
# Complete the exercises in this file. This assignment is to help you better
# understand Arrays, Hashes and Loops that we learned in Lesson 3.
#
###############################################################################
#
# 1. Review your solution to your homework from Lesson 2. Copy and Paste your
#    solution to this file.
#
# 2. Create a new Array variable called `set_of_numbers`, this will be
#    a range between 1 - 10 that our Player will guess from. Each value
#    in the Array should be an integer.
#
# set_of_numbers = (1..10).to_a

# 3. Change the variable `secret_number` (from last assignment) so that instead
#    of a hard-coded Integer, it randomly chooses one of the options from
#    `set_of_numbers` ('secret_number' is the integer our Player will try to
#    guess).
#
#      Hint: Look up Array#sample in the Ruby documentation.
#
# secret_number = set_of_numbers.sample

# 4. Create a new Hash variable called `messages`. In this Hash will be
#    four Keys Value pairs:
#
#    1. :win - A String telling the Player that they have won.
#
#    2. :lose - A String telling the Player that they have lost and what
#       the correct number was.
#
#    3. :too_low - A String telling the Player that their guess was too
#       low.
#
#    4. :too_high - A String telling the Player that their guess was too
#       high.
#
# messages = {win: "You win!", lose: "Sorry, you lose. The Secret Number was #{secret_number}." too_low: "Sorry, you guessed too low. You have #{guesses_left} guesses remaining." too_high: "Sorry, you guessed too high. You have #{guesses_left} remaining."}

# 5. Change the behavior of your program, so instead of hard coding, use the
#    principles of DRY(don't repeat yourself). This means using a Loop to
#    iterate over your code either until the Player has guessed the correct
#    number, or they have tried to guess 3 times.
#
# 3.times do 
#   puts "Guess the Secret Number. You have #{guesses_left} guesses left."
#   guess = gets.chomp.to_i
#   if guess == secret_number
#     puts messages[:win]
#     exit
#   elsif guess < secret_number
#     puts messages[:too_low]
#   elsif guess > secret_number
#     puts messages[:too_high]
#   else
#     puts messages[:lose]
# end

# 6. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
#  Put your solution below this line.
#
###############################################################################

# Identify creator and welcome the player
creator_name = "Craig Blanchard"
puts "Welcome to the Secret Number game, created by #{creator_name}."

# Set variables for guesses left, secret number sampler and messages hash
guesses_left = 3
set_of_numbers = (1..10).to_a
secret_number = set_of_numbers.sample		# replaces secret_number = 6
messages = {win: "You win!", 
            lose: "Sorry, you lose. The Secret Number was #{secret_number}.",
            too_low: "Sorry, you guessed too low.",     # Guesses remaining: #{guesses_left}.
            too_high: "Sorry, you guessed too high."}   # Guesses remaining: #{guesses_left}.


# Ask user's name, welcome them and tell them they have 3 guesses
puts "Please enter your name."
user_name = gets.chomp
puts "Hi, #{user_name}! You have #{guesses_left} guesses to guess the Secret Number between 1 and 10."

# Loop through asking for a number and returning appropriate message from hash
#
while guesses_left != 0
  guess = gets.chomp.to_i
  if guess == secret_number
    puts messages[:win]
    exit
  elsif guess > secret_number #&& guesses_left > 1
    puts messages[:too_high]
    guesses_left -= 1
  elsif guess < secret_number #&& guesses_left > 1
    puts messages[:too_low]
    guesses_left -= 1
  else
    puts messages[:lose]
    # After the fact: Took out the && statements above and added decrement statement below
    guesses_left -= 1
  end
end


# First stab... not working correctly

# while guesses_left != 0
#   guess = gets.chomp.to_i
#   if guess == secret_number
#     puts messages[:win]
#     exit
#   elsif guess < secret_number
#     guesses_left -= 1
#     puts messages[:too_low]
#   elsif guess > secret_number
#     guesses_left -= 1
#     puts messages[:too_high]
#   else 
#     puts messages[:lose]
#   end
# end

# #######################
# # Homework 2 "loop" replaced
# # Ask for the player's first guess
# guess = gets.chomp.to_i

# # Compare the guess to SN. If it is SN, print they win and exit, if not, say too high/low, decrement guesses, and ask for new number
# if guess == secret_number
#   puts "You guessed correctly! You win!"
#   exit
# elsif guess < secret_number
#   guesses_left -= 1
#   puts "Sorry, you guessed too low. You have #{guesses_left} guesses remaining."
#   guess = gets.chomp.to_i
# else guess > secret_number
#   guesses_left -= 1
#   puts "Sorry, you guessed too high. You have #{guesses_left} guesses remaining."
#   guess = gets.chomp.to_i
# end

# # Compare the guess to SN. If it is SN, print they win and exit, if not, say too high/low, decrement guesses, and ask for new number
# if guess == secret_number
#   puts "You guessed correctly! You win!"
#   exit
# elsif guess < secret_number
#   guesses_left -= 1
#   puts "Sorry, you guessed too low. You have #{guesses_left} guesses remaining."
#   guess = gets.chomp.to_i
# else guess > secret_number
#   guesses_left -= 1
#   puts "Sorry, you guessed too high. You have #{guesses_left} guesses remaining."
#   guess = gets.chomp.to_i
# end

# # Ask for number, if it is SN, print they win, if not, say they lose and tell then SN
# if guess == secret_number
#   puts "You guessed correctly! You win!"
# elsif guess < secret_number
#   guesses_left -= 1
#   puts "Sorry, you lose. The Secret Number was #{secret_number}."
# else guess > secret_number
#   guesses_left -= 1
#   puts "Sorry, you lose. The Secret Number was #{secret_number}."
# end