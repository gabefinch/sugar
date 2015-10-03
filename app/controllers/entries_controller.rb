class EntriesController < ApplicationController

  def index
  end
  def new
    @entry = Entry.new
  end
  def create
    @entry = entry.new(entry_params)
    if @entry.save
      flash[:notice] = "Entry added!"
      redirect_to root
    else
      flash[:error] = "There was a problem with the entry. Please try again."
      render :new
    end
  end
  def reports

  end
end
