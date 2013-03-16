class SecretNumber
  attr_reader :set_of_numbers, :secret_number

  # Initialize set of numbers, make it an array, and assign result of "generate_secret_number" to @secret_number variable
  def initialize(set_of_numbers)
    @set_of_numbers = set_of_numbers.to_a
    @secret_number = generate_secret_number
    # @secret_number = @set_of_numbers.sample
  end

  # upon initialization, @secret_number calls the private method generate_secret_number method
  private
  def generate_secret_number
    @set_of_numbers.sample
  end

end
