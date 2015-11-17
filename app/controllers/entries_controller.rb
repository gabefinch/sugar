class EntriesController < ApplicationController

  def index
    entries_today = Entry.entries_today.length
    if entries_today == 1
      @entrycount_message = "#{entries_today} entry today."
    else
      @entrycount_message = "#{entries_today} entries today."
    end
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
    if Entry.entries_today.length == 0
      @mean_msg = "Mean Average: Insufficient data"
      @max_msg = "Maximum Value: Insufficient data"
      @min_msg = "Minimum Value: Insufficient data"
    else
      @mean_msg = "Mean Average: " + Entry.mean.to_s
      @max_msg = "Maximum Value: " + Entry.max.to_s
      @max_msg = "Minimum Value: " + Entry.min.to_s
    end
    render :reports
  end
  private
    def entry_params
      params.require(:entry).permit(:value)
    end
end
