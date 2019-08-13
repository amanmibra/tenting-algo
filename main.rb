require "date"
require "faker"

require "./Person"
require "./Slot"
require "./algorithm"


class Olson
  include Algorithm
  # Main Driver
  def self.driver(peopleList, scheduleGrid)

    # Algorithm
    updatedPeopleList, updatedScheduleGrid = Algorithm.schedule(peopleList, scheduleGrid)

    return updatedPeopleList, updatedScheduleGrid

  end
end

# testing
people = Array.new
for i in 0..10
  p = Person.new(i, Faker::Name.name, 0, 0, 0, 0)
  people.push p
end

slotGrid = Array.new

for i in 0..100
  startDate = Time.now + rand(0..60*60*24) # any time within the next hr
  endDate = startDate + 60*10 # adding 60 min for 1 hr long Slots
  phase = ["Black", "Blue", "White"].sample
  isNight = startDate.hour < 7 && endDate.hour < 7
  row = i
  col = 0

  people.each do |p|
    id = p.id
    status = ["Available", "Unavailable"].sample
    if status == "Available"
      if isNight
        p.nightFree += 1
      else
        p.dayFree += 1
      end
    end
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

puts "people"
people.each do |p|
  puts p.name + " " + p.dayFree.to_s + ", " + p.nightFree.to_s
end

people, b = Olson.driver people, slotGrid

puts ""
puts "new people"
people.each do |p|
  puts p.name + " " + p.dayFree.to_s + ", " + p.nightFree.to_s
end
