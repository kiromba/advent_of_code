input = []
File.open('input.txt').each do |line|
  input << {
    policy: line.split(":")[0],
    password: line.split(":")[1].strip
  }
end

valid_passwords = 0
input.each do |password_policy|
  letter = password_policy[:policy].split(" ")[1]
  min, max = password_policy[:policy].split(" ")[0].split("-").map(&:to_i)
  valid_passwords += 1 if password_policy[:password].count(letter).between?(min, max)
end

puts valid_passwords

# part 2
valid_passwords = 0
input.each do |password_policy|
  letter = password_policy[:policy].split(" ")[1]
  min, max = password_policy[:policy].split(" ")[0].split("-").map { |i| i.to_i - 1}
  valid_passwords += 1 if (password_policy[:password][min] == letter && password_policy[:password][max] != letter) || (password_policy[:password][max] == letter && password_policy[:password][min] != letter)
end

puts valid_passwords
