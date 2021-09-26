vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurences(arr)
  hash = Hash[arr.collect {|item| [item, ""]} ]
  counts = hash.each {|k, v| counts[k] += 1}
end

p count_occurences(vehicles)