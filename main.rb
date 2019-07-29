require "faker"

require "./Person"
require "./Slot"
require "./algorithm"


class Olson
  include Algorithm
  # Main Driver
  def driver(peopleList, scheduleGrid)

    # Algorithm
    updatedPeopleList, updatedScheduleGrid = schedule(peopleList, scheduleGrid)

    return updatedPeopleList, updatedScheduleGrid

  end
end

people = Array.new
for i in 0..10
  p = Person.new(
    i,
    Faker::Name.name,
    Faker::Number.within(1..30),
    0,
    Faker::Number.within(1..10),
    Faker::Number.within(1..10),
  )
  people.push p
end

puts "people"
people.each do |p|
  puts p.name
end
