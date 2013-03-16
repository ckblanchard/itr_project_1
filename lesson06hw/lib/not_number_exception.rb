class NotNumberException < StandardError
  def initialize(message = "Please enter a number.")
    super(message)
  end
end