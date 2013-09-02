class TestMailController < ApplicationController
  def mail
    # UserMailer.meeting_request_with_calendar.deliver
    UserMailer.meeting_request_with_calendar.deliver
    render :text => "sent mail"
  end  
end
