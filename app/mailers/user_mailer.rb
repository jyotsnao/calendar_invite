class UserMailer < ActionMailer::Base
  def meeting_request_with_calendar
    @rndm_no = SecureRandom.hex(10)
    organizer_email_id =''
    sender_email_id = ''
    attendee_email_id = ''
    message = []
    message << "BEGIN:VCALENDAR"
    message << "PRODID:-//Microsoft Corporation//Outlook 10.0 MIMEDIR//EN"
    message << "VERSION:2.0"
    message << "METHOD:REQUEST"
    message << "BEGIN:VEVENT"
    message << "UID:#{@rndm_no}"
    message << "CREATED:20130901T072917Z"
    message << "DTSTAMP:20130910T072911Z"
    message << "DTSTART:20130910T092913Z"
    message << "DTEND:20130910T093911Z"
    message << "DESCRIPTION:Please attend this sample meeting"
    message << "SUMMARY:Invitation to attend #{@rndm_no}"
    message << "LOCATION:Earth"
    message << "ATTENDEE;RSVP=TRUE:mailto:#{attendee_email_id}"
    message << "ORGANIZER:MAILTO:#{organizer_email_id}"
    message << "LAST-MODIFIED:20130901T072917Z"
    message << "PRIORITY:5"
    message << "SEQUENCE:0"
    message << "STATUS:CONFIRMED"
    message << "TRANSP:OPAQUE"
    message << "END:VEVENT"
    message << "END:VCALENDAR"

    src = message.join("\r\n") 

    @text = src
  
      mail(to: [attendee_email_id],
         from: sender_email_id,
         subject: "Calendar Mail! #{@rndm_no}",
         content_type: "text/calendar; charset=UTF-8; method=REQUEST",
         )
  end
  


end
