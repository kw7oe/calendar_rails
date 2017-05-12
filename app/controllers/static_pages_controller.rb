class StaticPagesController < ApplicationController
  include StaticPagesHelper

  def home
    @weeks = data(Date.today)
    @week_days = [
      "Monday", 
      "Tuesday", 
      "Wednesday", 
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ]
  end

end
