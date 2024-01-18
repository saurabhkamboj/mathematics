# Ruby code to test Kaprekar's constant

KAPREKAR_CONSTANT = 6174

number = nil
loop do
  loop do
    print 'Enter any four digit number: '
    number = gets.chomp

    break unless number.match?(/[^0-9]/) || number.length != 4
    print "Error! Enter a valid number.\n\n"
  end

  print "Number => #{number}\n\n"

  loop do
    small_number = number.chars.sort.join
    large_number = small_number.reverse

    number = (large_number.to_i(10) - small_number.to_i(10)).to_s
    puts "#{large_number} - #{small_number} = #{number}"

    break if number.to_i == KAPREKAR_CONSTANT
  end

  print "Do you want to test another number? "
  break unless gets.chomp.include?('y')
end

# Alternate

number = number.to_i
loop do
  digits = []
  4.times do
    number, digit = number.divmod(10)
    digits.push(digit)
  end

  digits.sort!
  small_number = 0
  for digit in digits
    small_number = small_number * 10 + digit
  end

  digits.sort! { _2 <=> _1 }
  large_number = 0
  for digit in digits
    large_number = large_number * 10 + digit
  end

  number = large_number - small_number
  printf("%4d - %4d = #{number}\n", large_number, small_number)

  break if number == KAPREKAR_CONSTANT
end
