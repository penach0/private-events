class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(attendance_params)
  end

  private
    def attendance_params
      params.require(:attendance).permit(:attendee_id, :attended_event_id)
    end
end
