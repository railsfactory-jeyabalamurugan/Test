 require 'digest'
class OperationsController < ApplicationController
layout 'intel'
	def login
		render:layout=>'inde'
		@cal=Operation.new
	end

	def add
		@cal=Operation.new
		render:layout=>'intel'
	end


	def signup
		@cal=Operation.new
	end
	
	def create
		
			@cal=Operation.new(params[:cal])
 	
		         if @m=Operation.find_by_username(@cal.username)
				if @cal.password==""
					@message="**Enterpassword**"
					render :action=>"login"
				end
			        if @m.hashed_password==@cal.encrypt(@cal.password)
					render :action=>"create"
			        end
		        else if  @cal.username==""
				@message="**EnterUsername**"
				render :action=>"login"
			else if @cal.password==""
				@message="**Enterpassword**"
				render :action=>"login"
			else if  @cal.username!="" || @cal.password!=""
				@message="**InvalidUsername/password**"
				render :action=>"login"
		        end
		        end
			end
		        end
	end
	
	def logout
		@cal=Operation.new
	end
	
	def check
		
		@cal=Operation.new(params[:cal])
		@n1=@cal.email
		if @cal.save
				redirect_to :controller=>"users",  :action=>"new" 
			else if @cal.username=="" 
				@msg="**EnterUsername**"
				render :action => "signup"
                        else if @cal.email==""
				@msg="**EnterEmail**"
				render :action => "signup"
			else if @cal.password==""
				@msg="**Enterpassword**"
				render :action => "signup"
			else if @cal.username!="" || @cal.password!=""
				@msg="**EnterValidDetails**"
				render :action => "signup"
			end
			end
			end
			end
			end
		end
		 
end
