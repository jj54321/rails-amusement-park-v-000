class SessionsController < ApplicationController

  def new
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:id])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/users/new'
    end
  end

  def destroy
    session.clear
    redirect_to root_url
  end
end
