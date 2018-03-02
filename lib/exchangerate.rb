require "exchangerate/rate_finder"
require "date"

#TODO: add better exception handling, more useful messages, etc.

class ExchangeRate
  def self.at(date = Date.today, base_currency, counter_currency)
    if base_currency != counter_currency
      date_string = date.to_s

      base_currency_rate = RateFinder.find_rate_for_currency(date, base_currency)
      counter_currency_rate = RateFinder.find_rate_for_currency(date, counter_currency)

      if base_currency_rate.to_s.empty? or counter_currency_rate.to_s.empty?
        return puts "Invalid request"
      end

      result_rate = counter_currency_rate / base_currency_rate

      #puts "%.4f" % result_rate
    else
      return 1.000
      #puts "1.0000"
    end
  end
end

#ExchangeRate.at(Date.today.prev_day, 'AAA', 'USD')
