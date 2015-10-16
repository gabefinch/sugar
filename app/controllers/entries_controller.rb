class EntriesController < ApplicationController

  def index
    @entries_today = Entry.entries_today
  end
  def new
    @entry = Entry.new
  end
  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:notice] = "Entry added!"
      redirect_to :action => 'index'
    else
      flash[:error] = ""
      messages = @entry.errors.messages[:value]
      messages.each do |message|
        flash[:error] += "Value " + message + ". "
      end
      if messages.include? "exceeds the number of allowed entries (4/day)"
        redirect_to :action => 'index'
      else
        render :new
      end

    end
  end
  def reports

  end
  private
    def entry_params
      params.require(:entry).permit(:value)
    end
end
