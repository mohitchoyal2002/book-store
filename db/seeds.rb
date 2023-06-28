5.times do |i|
	Book.create(title: "Book #{i+1}", body: "Discription of book name Book #{i+1}")
end
