class EntriesController < ApplicationController
  def new
    @visitor = Visitor.new
    @entry = @visitor.entries.new
  end

  def create
    @entry = Entry.new(entry_deetz)
    if @entry.save
      redirect_to root_path
    else
      redirect_to contact_path
    end
  end

  def index
    case params[:filter]
    when 'projects'
      @projects = Project.all
    else
      @entries = User.first.entries
    end
  end
private
  def entry_deetz
    params.require(:entry).permit(:title, :body, visitor: [:email, :name])
  end
end
