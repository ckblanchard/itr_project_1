class Player
  attr_accessor :name
  attr_reader :current_guess_count


  # Initialize variables for name and current_guess_count
  def initialize(name, current_guess_count = 0)
    @name = name
    @current_guess_count = current_guess_count
  end

end