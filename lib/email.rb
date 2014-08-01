require 'mailgun'

class Email
    Mailgun.configure do |config|
      config.api_key = 'key-766ca457ee7d8e8db55bb77efc9252fc'
      config.domain  = 'sandbox039455d554a44b40b3cf12a87b6a8822.mailgun.org'
    end

  def send_email(message)
    parameters = {
      :to => "t.manawer@mybihs.org",
      :subject => "Upcoming Matches",
      :text => message,
      :from => "postmaster@sandbox039455d554a44b40b3cf12a87b6a8822.mailgun.org"
    }
    @mailgun = Mailgun()
    @mailgun.messages.send_email(parameters)

  end
end




