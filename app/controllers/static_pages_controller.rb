class StaticPagesController < ApplicationController
  include StaticPagesHelper

  def home
    @weeks = data(Date.today)
    @month = Date.today.strftime('%B')
    @week_days = [
      "Mon", 
      "Tue", 
      "Wed", 
      "Thur",
      "Fri",
      "Sat",
      "Sun"
    ]
  end

end
