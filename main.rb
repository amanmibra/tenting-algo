require "date"
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

slotGrid = Array.new

# TODO: Fix Time object
now = Time.now
startToday = Time.new(now.year, now.month, now.day, 0, 0, 0, now.zone)
endToday = Time.new(now.year, now.month, now.day, 23, 59 , 59, now.zone)

for i in 0..100
  startDate = rand(startToday..endToday)
  endDate = startDate + 60 # adding 60 min for 1 hr long Slots
  phase = ["Black", "Blue", "White"].sample
  isNight = startDate.hour < 7 && endDate.hour < 7
  row = i
  col = 0

  people.each do |p|
    id = p.id
    status = ["Available", "Unavailable"].sample
    slot = Slot.new(
      id,
      startDate,
      endDate,
      phase,
      isNight,
      status,
      row, col
    )

    if !slotGrid[id]
      slotGrid[id] = Array.new
    end
    slotGrid[id].push(slot)
  end
end
