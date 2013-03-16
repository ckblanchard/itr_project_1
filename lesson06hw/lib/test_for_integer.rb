module TestForInteger

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

end

# TestForInteger.get_low_num
# TestForInteger.get_high_num

# until TestForInteger.get_low_num == true
# end
# puts @low_num
# until TestForInteger.get_high_num == true
# end
# puts @high_num






