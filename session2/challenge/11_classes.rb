# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.
# 99/10 = 9.9 => 9 => "Ninety"
# 99%10 = 9 => "Nine"
#
# 98/10 =
#
# 90 + 9

class BeerSong
  attr_accessor 'num', 'letters'
  def initialize(num)
    @letters = {
      90 => "ninety",
      80 => "eighty",
      70 => "seventy",
      60 => "sixty",
      50 => "fifty",
      40 => "forty",
      30 => "thirty",
      20 => "twenty",
      19=>"nineteen",
      18=>"eighteen",
      17=>"seventeen",
      16=>"sixteen",
      15=>"fifteen",
      14=>"fourteen",
      13=>"thirteen",
      12=>"twelve",
      11 => "eleven",
      10 => "ten",
      9 => "nine",
      8 => "eight",
      7 => "seven",
      6 => "six",
      5 => "five",
      4 => "four",
      3 => "three",
      2 => "two",
      1 => "one",
      0 => "zero"
    }

    @num = num
    if num > 99
      self.num = 99
    elsif num < 0
      self.num = 0
    end
  end

  def numbers_to_string(num)
    #except for 19 and less
    if num < 20
      return letters[num].to_s
    else
      tens = (num / 10) * 10
      units = num % 10
      if units == 0
        return letters[tens].to_s
      else
        return letters[tens].to_s + "-" + letters[units].to_s
      end
    end
  end

  def print_song

    if @num == 0
      puts ""
    end

    @num.downto(1) do |i|

      bottle = "bottles"
      bottle2 = "bottles"

      if(i == 1)
        bottle = "bottle"
        bottle2 = "bottles"
      elsif (i == 2)
        bottle = "bottles"
        bottle2 = "bottle"
      end

      puts "#{numbers_to_string(i).capitalize} #{bottle} of beer on the wall,"
      puts "#{numbers_to_string(i).capitalize} #{bottle} of beer,"
      puts "Take one down, pass it around,"
      puts "#{numbers_to_string(i-1).capitalize} #{bottle2} of beer on the wall."
    end

  end



end
