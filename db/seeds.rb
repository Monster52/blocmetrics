require 'faker'

event_names = ['users', 'page visits']

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

# Create Applications
30.times do
  Application.create!(
    url: Faker::Internet.url,
    user: users.sample
  )
end
applications = Application.all
puts "#{Application.count} applications created."

# Create Events
1000.times do
  Event.create!(
    name: event_names.sample,
    application: applications.sample
  )
end
events = Event.all
puts "#{Event.count} events created."
