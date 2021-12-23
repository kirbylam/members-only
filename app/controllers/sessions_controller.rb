class SessionsController < ApplicationController
  def new
    session[:current_user_id]
  end

  def create
    session_params = params.permit(:username, :password)
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Login is invalid!"
      redirect_to new_session_path
    end
  end

  def destroy

  end
end
