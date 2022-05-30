class InvitationsController < ApplicationController
  before_action :require_login

  def create
    event = Event.find(params[:event_id])
    invitation = Invitation.new(event_id: event.id, user_id: params[:user_id])

    if invitation.save
      invitation.invited!
      flash[:notice] = "Invitation Sent."
    else
      flash[:alert] = 'An error occur. Please try again.'
      redirect_to event_path(event)
    end
  end

  # def destroy
  #   event = Event.find(params[:event_id])

  # end

end
