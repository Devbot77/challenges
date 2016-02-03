h = {
	key1: 'word', 
	key2: 'awesome',
}

a = ['word', 'awesome']

puts h[:key1]
puts a[0]
h[:key0] = 'ruby'
a.unshift('ruby')
puts h[:key1]
i = a.find_index('word')
puts a[i]