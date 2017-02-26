class WelcomesController < ApplicationController
  def index
    @user = User.first
  end

  def resume
  end
end
