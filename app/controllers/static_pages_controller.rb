class StaticPagesController < ApplicationController
  include CalenderHelper

  def home    
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @weeks = weeks(@date)
    @week_days = WEEKDAYS
  end

end
