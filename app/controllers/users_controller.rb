class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # @events = Event.where(creator_id: session[:user_id].to_i).order(date: :asc)
    @upcoming_events = current_user.events.upcoming_events
    @past_events = current_user.events.prev_events
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
    flash[:success] = 'Log out with succes'
    redirect_to root_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:name)
  end
end
