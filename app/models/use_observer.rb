require 'Authenticated_System.rb'

class UseObserver < ActiveRecord::Observer

  def after_create(use)
    UseMailer.signup_notification(use).deliver
  end

  def after_save(use)
    UseMailer.activation(use).deliver if use.recently_activated?
  end

end
