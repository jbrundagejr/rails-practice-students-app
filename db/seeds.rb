Instructor.destroy_all
Student.destroy_all

puts "Creating Instructors..."

4.times do
  Instructor.create(name: Faker::Movies::StarWars.character)
end

puts "Creating Students..."
20.times do
  Student.create(name: Faker::TvShows::Simpsons.character, major: Faker::Educator.degree, age: rand(19..23), instructor_id: Instructor.all.sample.id)
end

puts "Done!"