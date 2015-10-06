class EntriesController < ApplicationController

  def index
  end
  def new
    @entry = Entry.new
  end
  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:notice] = "Entry added!"
      render :index
    else
      flash[:error] = ""
      @entry.errors.messages[:value].each do |message|
        flash[:error] += "Value " + message + ". "
      end
      render :new
    end
  end
  def reports

  end
  private
    def entry_params
      params.require(:entry).permit(:value)
    end
end
