module TestForInteger

  # is_integer needs work. For now use specific methods below
  def is_integer?(int)
    int_num = int.to_i
    if int_num.to_s == int
      int_num
    else
      puts "That's not a number"
    end
  end

  def get_low_num
    puts "Enter a number."
    i = gets.chomp
    i_num = i.to_i
    if i_num.to_s == i
      @low_num = i_num
      return true
    else
      return false
    end
  end

  def get_high_num
    puts "Enter a number."
    i = gets.chomp
    i_num = i.to_i
    if i_num.to_s == i
      @high_num = i_num
      return true
    else
      return false
    end
  end

  def is_integer
    i = gets.chomp
    i_num = i.to_i
    if i_num.to_s == i
      @is_integer = i_num
      return true
    else
      puts "That's not a number."
      return false
    end
  end

  def guesses_num
    puts "And finally, how many chances would you like?"
    i = gets.chomp
    i_num = i.to_i
    if i_num.to_s == i
      @guesses_allowed = i_num
      return true
    else
      return false
    end
  end

end
include TestForInteger
# TestForInteger.get_low_num
# TestForInteger.get_high_num
# TestForInteger.is_integer
# @is_integer

# until TestForInteger.get_low_num #== true
# end
# puts @low_num
# until TestForInteger.get_high_num == true
# end
# puts @high_num






