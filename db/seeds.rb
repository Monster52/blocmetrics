require 'faker'

# Create Users
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password'
  )
end
users = User.all
puts "#{User.count} users created."

# Create Admin
unless User.find_by(email: "admin@email.com")
  admin = User.create!(
    email: "admin@email.com",
    password: 'password'
  )
  puts "Created admin@email.com"
  puts "Email: #{admin.email} Password: #{admin.password}"
else
  puts "Skipped creation of \"admin@email.com\""
end
