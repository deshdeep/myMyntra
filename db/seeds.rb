# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

i = 1
for i in (1..100) do
Product.create(brand: 'rock'+i.to_s, name: 'laptop'+i.to_s, price: 100+i, size: 'medium'+i.to_s, category: 'unisex')
end

i = 1
for i in (1..100) do
Customer.create(first_name: 'desh'+i.to_s, last_name: 'deep'+i.to_s, email: 'deshdeep'+ i.to_s + '@gmail.com', mobile_number:
				'1234567890', password: 'password', password_confirmation: 'password')
end