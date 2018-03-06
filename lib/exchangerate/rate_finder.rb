require "nokogiri"
require "date"
require "open-uri"

class RateFinder

  def self.find_rate_for_currency(date, currency_code)
    xpath_string = "///xmlns:Cube[@time=\"#{date}\"]//xmlns:Cube[@currency=\"#{currency_code}\"]/@rate"
    rates_xml = Nokogiri::XML(File.open("lib/exchangerate/rates.xml"))
    test = rates_xml.to_s

    # prepopulates rates.xml if not already populated
    if rates_xml.to_s.empty? or rates_xml.to_s == "<?xml version=\"1.0\"?>\n"
      rates_feed_data = Nokogiri::XML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))
      File.open("lib/exchangerate/rates.xml", "w") {|f| f.write(rates_feed_data.to_xml)}
      rates_xml = Nokogiri::XML(File.open("lib/exchangerate/rates.xml"))
    end

    rate_node = rates_xml.at_xpath(xpath_string)

    if rate_node.nil?
      return rate_node
    end

    rate = rate_node.content.to_f

  end
end