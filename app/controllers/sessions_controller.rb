class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:session][:user])
    @user ||= User.find(params[:session][:user].to_i)

    if @user
      session[:user_id] = @user.id
      session[:username] = @user.name
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'Wrong login info'
      render 'new'
    end
  end

  def destroy
    reset_session
    # session[:username] = nil
    flash[:success] = 'Log out successfully'
    redirect_to root_path
  end
end
