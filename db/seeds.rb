# db/seeds.rb
require 'faker'

puts "Seeding database..."

# Clear existing data (order matters because of FK constraints)
OrderItem.destroy_all
Order.destroy_all
Employee.destroy_all
Product.destroy_all
Category.destroy_all
Supplier.destroy_all
Customer.destroy_all
Store.destroy_all

puts "Creating Stores..."
stores = 5.times.map do
  Store.create!(
    name: Faker::Company.unique.name,
    location: Faker::Address.full_address
  )
end

puts "Creating Suppliers..."
suppliers = 10.times.map do
  Supplier.create!(
    name: Faker::Company.unique.name,
    contact_info: Faker::PhoneNumber.phone_number
  )
end

puts "Creating Categories..."
categories = %w[Produce Dairy Meat Bakery Beverages Snacks Frozen Household].map do |cat_name|
  Category.create!(name: cat_name)
end

puts "Creating Products..."
products = 30.times.map do
  Product.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 0.5..100.0),
    description: Faker::Marketing.buzzwords,
    category: categories.sample,
    supplier: suppliers.sample,
    store: stores.sample
  )
end

puts "Creating Customers..."
customers = 20.times.map do
  Customer.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email
  )
end

puts "Creating Employees..."
employees = 10.times.map do
  Employee.create!(
    name: Faker::Name.name,
    position: Faker::Job.position,
    store: stores.sample
  )
end

puts "Creating Orders..."
orders = 15.times.map do
  Order.create!(
    customer: customers.sample,
    employee: employees.sample,
    store: stores.sample,
    created_at: Faker::Time.backward(days: 30)
  )
end

puts "Creating Order Items..."
orders.each do |order|
  rand(1..5).times do
    OrderItem.create!(
      order: order,
      product: products.sample,
      quantity: rand(1..10)
    )
  end
end

puts "Seeding done!"
