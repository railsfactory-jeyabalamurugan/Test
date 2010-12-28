class UseMailer < ActionMailer::Base

  def signup_notification(use)
    setup_email(use)
    @subject    += 'Please activate your new account'
       @url  = "http://YOURSITE/activate/#{use.activation_code}"
  end
  
  def activation(use)
    setup_email(use)
    @subject    += 'Your account has been activated!'
    @url  = "http://YOURSITE/"
  end
  
  protected

  def setup_email(use)
    @recipients  = "#{use.email}"
    @from        = "ADMINEMAIL"
    @subject     = "[YOURSITE] "
    @sent_on     = Time.now
    @use = use
  end

end
