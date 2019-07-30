# Slots objects make up the ScheduleGrid input.

class Slot
  attr_accessor :personID,
                :startDate, :endDate,
                :phase,
                :isNight,
                :status,
                :row, :col,
                :weight

  def initialize(personID, startDate, endDate, phase, isNight, status, row, col, weight=1)
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
