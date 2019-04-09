require './algorithm'
require './globals'
require './helpers'
require './setup'
require './status'
require './weight'
require './Person'
require './Slot'
 
# Person objects make up the list of people input.

class Person
  def initialize(id, name, dayFree, nightFree, dayScheduled, nightScheduled)
    @id = id
    @name = name
    @dayFree = dayFree
    @dayScheduled = dayScheduled
    @nightFree = nightFree
    @nightScheduled = nightScheduled
    # @maxDayHours = maxDayHours
    # @idealDayHours = idealDayHours
  end
end
