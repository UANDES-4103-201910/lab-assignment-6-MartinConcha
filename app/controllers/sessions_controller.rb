class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email])
	    if user && user[:password] == params[:session][:password]
	      	log_in user
      		redirect_to user
      		flash[:notice] = "Welcome back!"
	    else
	      	flash.now[:error] = "Invalid email/password combination."
	      	render 'new'
		end
	end

	def destroy
	    log_out
	    redirect_to root_url
	end
end
