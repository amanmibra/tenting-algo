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

# testing
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

slots = Array.new

startToday = Time.now.beginning_of_day
endToday = Time.now.end_of_day
for i in 0..100
  startDate = rand(startToday..endToday)
  endDate = startDate + 60 # adding 60 min for 1 hr long Slots
  # TODO: Understand scheduleGrid and how Slots work, then finish test
end
