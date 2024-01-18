# Ruby code to test Kaprekar's constant

KAPREKAR_CONSTANT = 6174

number = 0
loop do
  print 'Enter any four digit number: '
  number = gets.chomp

  break unless number.match?(/[^0-9]/) || number.length != 4
  puts "Error! Enter a valid number."
end

puts "Number => #{number}"

loop do
  small_number = number.chars.sort.join
  large_number = small_number.reverse

  number = (large_number.to_i(10) - small_number.to_i(10)).to_s
  puts "#{large_number} - #{small_number} = #{number}"

  break if number.to_i == KAPREKAR_CONSTANT
end
