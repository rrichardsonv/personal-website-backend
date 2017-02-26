class EntriesController < ApplicationController
  def new
  end

  def create
  end

  def index
    case params[:filter]
    when 'projects'
      @projects = Project.all
    else
      @entries = User.first.entries
    end
  end
end
