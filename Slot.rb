# Slots objects make up the ScheduleGrid input.

class Slot
  def initialize(personID, startDate, endDate, phase, isNight, status, row, col, weight)
    @personID = personID
    @startDate = startDate
    @endDate = endDate
    @phase = phase
    @isNight = isNight
    @status = status
    @row = row
    @col = col
    @weight = 1
  end
end
