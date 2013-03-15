###############################################################################
#
# Introduction to Ruby on Rails
#
# Lesson 5 homework
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# will help you to review more advanced topics on Object-Oriented
# Programming within the Ruby context based on what we've learned in
# Lesson 5.
#
###############################################################################
#
# 1. Review your solution to lesson 4 homework. Copy and Paste your solution to
#    this file.
#
# 2. Create a new folder called `lib` by running:
#
#    mkdir lib
#
# 3. Create a new file called `player.rb` with the class
#    `Player` defined within it in the `lib` directory.
#
#   1. In its initialize method, it should keep track of the Player's
#      name stored in the instance variable `@name`. When we create
#      a new Player, the initialize method should accept a parameter
#      that will be set for this instance variable.
#
#   2. Also, it should have an instance variable called
#      `@current_guess_count` which by default starts at 0.
#
#   3. Create a new method called `increment_guess_count` which increments
#      `@current_guess_count` by 1.
#
#   4. Make sure that the instance variable `@current_guess_count` can be
#      READ but not WRITTEN to.
#
#       Hint: Which `attr_` should you use at the top of your Class?
#
#   5. Make sure that the instance variable `@name` can be READ and
#      WRITTEN to.
#
#       Hint: Which `attr_` should you use at the top of your Class?
#
# 4. Create a new file called `secret_number.rb` with the class
#    `SecretNumber` defined within it in the `lib` directory.
#
#    1. The initialize method should accept a paramter of a range of
#       numbers that the Player must guess from and should be saved into
#       the instance variable `@set_of_numbers`. If not parameter is set,
#       it should default to (0..10).
#
#    2. In its initialize method, you should have an instance variable
#       called `@secret_number` which will hold the randomly generated
#       secret number that the Player must guess.
#
#    3. Make sure that the instance variables `@secret_number`,
#       `@guesses_allowed`, and @set_of_numbers may only be READ and
#       not WRITTEN to.
##### @guesses_allowed ... where do we assign if it's only read?
#
#    4. Create a new private class method called `generate_secret_number`,
#       set your instance variable `@secret_number` to call this method upon
#       initialization.
#
# 6. Create a new file called `game.rb` with the class `Game` defined
#    within it in the `lib` directory.
#
#    1. In its initialize method, it should keep track of how many
#       guesses are allowed to be made by the Player in the Integer instance
#       variable `@guesses_allowed`. When we create a new Game, the
#       initialize method should accept a parameter that will be set for
#       this instance variable. If no parameter is set, it should default
#       to `3`.
#
#    2. Additionally, it should accept as a parameter a range of
#       numbers that will be passed along to the `SecretNumber` class.
#
#    3. Also in its initialize method, it should keep track of how many
#       guesses have been currently made by the Player. Create the
#       Integer instance variable `@current_guess_count`. By default, set
#       this to `0`.
#
#    4. Your initialize method should also create the instance variables
#       `@player` and `@secret_number`. Set these variables
#       to create new instances of each of these classes. For the new
#       SecretNumber instance, pass along the set_of_numbers parameter.
#
#    5. Make sure that the instance variables `@guesses_allowed` and
#       `@current_guess_count` may only be READ and not WRITTEN to.
#
#    6. In your initialize method, create a new Integer instance
#       variable called `@current_guess` and set it to `nil` by default.
#       This will keep track of the Player's current guess.
#
#    6. Move the `increment_guess_count` method from your Player class
#       to the Game class. Instead of hard-coding the number of guesses
#       allowed as `3` use the new `@guesses_allowed` instance variable.
#
#    7. In your Game class, create the class variable `@@messages`. Move
#       your logic for creating your `messages` Hash from this file to the
#       Game class.
#
#    8. Create a new public instance method called `guess_correct?`
#       that accept the parameter `guess`. This will evalute whether or
#       not the Player's guess is correct. Use cases or conditionals to
#       see if the Player guessed correctly or guessed too high or too
#       low. Use the `@@messages` Hash to display which message to show to
#       the user. Also let the Player know how many guesses they have
#       left. If the guess is correct, make sure to return true,
#       otherwise return false.
#
#    7. Create a new public instance method in your Game class called
#       `print_created_by`. Move your logic from this file into this new
#       method so that when this method is called, your name will be
#       shown.
#
#    8. Create a new public instance method in your Game class called
#       `start_game`. In this method:
#
#       1. First call the method `print_created_by` so that your credit
#          is shown to the Player.
#
#       2. Next, ask the Player their name. Save this to @player.name.
#
#       3. Tell the Player how many guesses they get and the range of
#          numbers they can choose from.
#
#       4. Loop through however many `@guesses_allowed` are, running
#          increment_guess_count along the way. On each call, you should
#          ask the Player for their guess and use the `guess_correct?`
#          method. If at the end of the loop they still did not guess
#          correctly, tell the player that they have lost using the
#          `@@messages` class variable and what the secret number was.
#
# 7. In this file, load `player.rb`, `secret_number.rb`, and `game.rb`
#    along with their respective classes using `require_relative`.
#
# 8. For the most part, everything has been removed from this file and
#    placed in other classes. Now, when this Ruby script is run it
#    should:
#
#    1. Create a new instance of the class Game. Here when you
#       initialize the new Game, you can set how many guesses a Player
#       gets to guess the secret number and the range of numbers they
#       can select from.
#
#    2. Make sure to call the method `start_game` to get this
#       party started!
#
#    3. At the end, feel free to let your Player know, "Thanks for
#       Playing!"
#
# 9. Remember to keep your code clean and keep in mind how your file is
#    laid out. You want to make sure that the TAs reading your work will
#    understand your though process and give you good marks.
#
###############################################################################
#
# Student's Solution
#
###############################################################################
$LOAD_PATH.unshift(File.join(__FILE__, "../lib"))
require "player"
require "secret_number"
require "game"

game = Game.new
game.start_game

# Below tests output for various game class methods
# puts game.guesses_allowed
# puts game.current_guess_count
# puts game.secret_number.secret_number
# puts game.set_of_numbers
# puts game.print_created_by
# puts game.current_guess
