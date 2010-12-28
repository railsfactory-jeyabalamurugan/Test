
class UsersController < ApplicationController
layout 'intel'
 def create 
puts "**********"	 
 puts  params.inspect
 @user=User.create(params[:user])
 @user.save
 @user=User.find(:all)
 render :action=>'show'	
  end

  def new
  @user=User.new

  end

  def show
 @user=User.find(:all)

  end

end
