numbers = []
File.open('input.txt').each do |line|
  numbers << line.to_i
end

for i in numbers do
  for j in numbers do
    next if i == j
    found = [i, j] if i + j == 2020
  end
end

puts found.inject(:*)
