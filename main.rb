require "date"
require "faker"
require "pp"
require "gthc"

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
slotGrid = Array.new
currentTime = Time.now

for i in 0..10
  # create and add person
  p = Person.new(i, Faker::Name.name, 0, 0, 0, 0)

  # create and add their slots
  startTime = currentTime
  slots = Array.new
  for j in 0..5
    endTime = startTime + 60*60 - 1 # make slots 1 hr long
    isNight = startTime.hour < 7 || endTime.hour < 7
    row = j
    col = i

    status = ["Available", "Unavailable", "Scheduled"].sample
    if status == "Available"
      if isNight
        p.nightFree += 1
      else
        p.dayFree += 1
      end
    elsif status == "Scheduled"
      if isNight
        p.nightScheduled += 1
      else
        p.dayScheduled += 1
      end
    end

    slot = Slot.new(
      i,
      startTime,
      endTime,
      "Black",
      isNight,
      status,
      row, col
    )

    slots.push slot
    startTime = endTime + 1
  end

  people.push p
  slotGrid.push slots
end


# for i in 0..5
#   startDate = Time.now + rand(0..60*60*24) # any time within the next hr
#   endDate = startDate + 60*10 # adding 60 min for 1 hr long Slots
#   phase = ["Black", "Blue", "White"].sample
#   isNight = startDate.hour < 7 && endDate.hour < 7
#   row = i
#   col = 0

#   people.each do |p|
#     id = p.id
#     status = ["Available", "Unavailable"].sample
#     if status == "Available"
#       if isNight
#         p.nightFree += 1
#       else
#         p.dayFree += 1
#       end
#     end
#     slot = Slot.new(
#       id,
#       startDate,
#       endDate,
#       phase,
#       isNight,
#       status,
#       row, col
#     )

#     if !slotGrid[id]
#       slotGrid[id] = Array.new
#     end
#     slotGrid[id].push(slot)
#   end
# end

puts "old people"
pp people[1]
puts ''
pp slotGrid[1]

# people, b = GTHC::Olson.driver people, slotGrid
# puts ""
# puts "new people"
# pp people[1]
# puts ''
# pp b[1]

test = GTHC::Olson.driver people, slotGrid
puts 'test'
pp test