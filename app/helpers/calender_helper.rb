module CalenderHelper

  WEEKDAYS = [
    "Mon", 
    "Tue", 
    "Wed", 
    "Thur",
    "Fri",
    "Sat",
    "Sun"
  ]

  # Generate weeks of the current month, 
  # which contains 7 days.
  def weeks(date)
    range = date.beginning_of_month..date.end_of_month
    result = range.chunk_while { |date| date.cwday < 7 }.to_a

    if result.first.length < 7 
      (7 - result.first.length).times do 
        result.first.unshift(NullDay.new)
      end
    end

    if result.last.length < 7 
      (7 - result.last.length).times do 
        result.last.push(NullDay.new)
      end
    end
    
    result
  end

  # Generate <td> elements for days
  def td_for(date)
    className = if date == Date.today 
      "today"
    elsif date.day.nil?
      "null_day"
    end

    pTag = content_tag(
      :p, 
      add_padding_to(date.day), 
      class: className
    )
    content_tag(:td, pTag) 
  end

  def add_padding_to(day)
    return nil if day.nil?
    return "0#{day}" if day < 10 
    day.to_s
  end

end

# Null Object Pattern
class NullDay 
  attr_reader :day
  def initialize
    @day = nil
  end
end