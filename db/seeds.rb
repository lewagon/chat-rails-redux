# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = %w(general paris react)

names.each do |name|
  c = Channel.find_or_create_by(name: name)
end

puts "This db has #{Channel.count} channels: #{Channel.pluck(:name).join(", ")}."
