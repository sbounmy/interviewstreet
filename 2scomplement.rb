# 2's complement (10 Points)
# One of the basics of Computer Science is knowing how numbers are represented in 2's complement. Imagine that you write down all numbers between A and B inclusive in 2's complement representation using 32 bits. How many 1's will you write down in all ?
# Input:
# The first line contains the number of test cases T (<1000). Each of the next T lines contains two integers A and B.
# Output:
# Output T lines, one corresponding to each test case.
# Constraints:
# -2^31 <= A <= B <= 2^31 - 1
# 
# Sample Input:
# 3
# -2 0
# -3 4
# -1 4
# Sample Output:
# 63
# 99
# 37
# 
# Explanation:
# For the first case, -2 contains 31 1's followed by a 0, -1 contains 32 1's and 0 contains 0 1's. Thus the total is 63.
# For the second case, the answer is 31 + 31 + 32 + 0 + 1 + 1 + 2 + 1 = 99
# Hint:
# Can you solve this problem when A and B are both positive? If yes, what's the relation between the number of 1's between -X to 0 and 0 to X

entries = gets
entries = entries.to_i

inputs = []
entries.times do |i|
  inputs[i] = gets
  inputs[i] = inputs[i].split(" ").map(&:to_i)
end

inputs.each do |input|
  total_count = 0
  (input.first..input.last).each do |n|
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
