class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && User.authenticate(session_params[:email], session_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      #error messages
    end
    redirect_to user_path(@user)
        #create local user from session params
        #check if user exists `if user && ...`
        #validate session params using user.auth method
        # session[:user_id] = user.id  creates session
        #redirect_to

        #else flash
        #else flash
  end

  def destroy
  end

private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
