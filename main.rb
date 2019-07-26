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

  # Algorithm
  updatedPeopleList, updatedScheduleGrid = schedule(peopleList, scheduleGrid)

  return updatedPeopleList, updatedScheduleGrid

end
