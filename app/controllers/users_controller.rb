class UsersController < ApplicationController
  def set_user
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
end
