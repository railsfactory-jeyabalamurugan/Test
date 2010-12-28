

class UsesController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
require 'authenticated_system.rb'
  include AuthenticatedSystem
  layout 'intel'

  # render new.rhtml
  def new
    @use = Use.new
  end
 
  def create
    logout_keeping_session!
    @use = Use.new(params[:use])
    success = @use && @use.save
    if success && @use.errors.empty?
      redirect_back_or_default('/users/new', :notice => "Thanks for signing up!  We're sending you an email with your activation code.")
    else
      flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    use = Use.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && use && !use.active?
      use.activate!
      redirect_to '/login', :notice => "Signup complete! Please sign in to continue."
    when params[:activation_code].blank?
      redirect_back_or_default('/', :flash => { :error => "The activation code was missing.  Please follow the URL from your email." })
    else 
      redirect_back_or_default('/', :flash => { :error  => "We couldn't find a use with that activation code -- check your email? Or maybe you've already activated -- try signing in." })
    end
  end

end
