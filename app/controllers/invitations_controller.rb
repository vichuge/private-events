class InvitationsController < ApplicationController
  def create
    event_id = params[:event_id]
    @attendee = Invitation.find_or_initialize_by(attendee_id: current_user.id, attended_event_id: event_id)
    redirect_to root_path if @attendee.save
  end
end
