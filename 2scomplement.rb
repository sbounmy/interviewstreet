entries = gets
entries = entries.to_i

inputs = []
entries.times do |i|
  inputs[i] = gets
  inputs[i] = inputs[i].split(" ").map(&:to_i)
end

puts inputs.inspect
inputs.each do |input|
  total_count = 0
  (input.first..input.last).each do |n|
    # count = init_count
    count = 0
    m = n >= 0 ? n : (-n - 1)
    p = 31
    while p >= 0 do
      r = m - 2**p
      if r >= 0
        m -= 2**p
        count += 1
      else
        r = m
      end
      p -= 1
    end
    count = 32 - count if n < 0
    total_count += count
  end
  puts total_count
end
