require './algorithm'
require './globals'
require './helpers'
require './setup'
require './status'
require './weight'
require './Person'
require './Slot'

# Main Driver
def driver(peopleList, scheduleGrid)

  # Setup
  people = createPeople(peopleList)
  slots = createSlots(scheduleGrid)

  # Algorithm
  results = schedule(people,slots,scheduleGrid)

  # Result
  updatedPeopleList = results.at(0)
  updatedScheduleGrid = results.at(1)

  return updatedPeopleList, updatedScheduleGrid

end
