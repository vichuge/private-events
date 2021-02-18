class UsersController < ApplicationController
  def show
    @events = Event.where(creator_id: session[:user_id].to_i)
    @upcoming_events = @user.attended_events.upcoming
    @prev_events = @user.attended_events.past
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(sign_up_params)
    if @user.save
      flash[:notice] = 'User created successfully'
      session[:user_id] = @user.id
      session[:username] = @user.name
      redirect_to user_path(@user)
    else
      flash[:alert] = 'User not created, please try again'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    flash[:success] = 'Log out with success'
    redirect_to root_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:name)
  end
end
