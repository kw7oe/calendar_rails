module StaticPagesHelper

  def data(date)
    range = date.beginning_of_month..date.end_of_month
    result = range.chunk_while { |date| date.cwday < 7 }.to_a

    if result.first.length < 7 
      (7 - result.first.length).times do 
        result.first.unshift(NullDay.new)
      end
    end
    
    result
  end
end

# Null Object Pattern
class NullDay 
  attr_reader :day
  def initialize
    @day = nil
  end
end
