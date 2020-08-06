class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  before_action :set_child, only: [:show]

  def show; end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def set_child
    @child = Child.find(current_user.id)
  end
end
