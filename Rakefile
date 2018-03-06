require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :rates do
  desc "Gets data from ECB 90-day online XML feed and saves locally to lib/exchangerate/rates.xml"
  task :retrieve do
    require "nokogiri"
    require "open-uri"

    rates = Nokogiri::XML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))
    unless rates.to_s.empty?
      File.open("lib/exchangerate/rates.xml", "w") {|f| f.write(rates.to_xml)}
    end

  end
end