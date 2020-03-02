# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exchangerate/version'

Gem::Specification.new do |spec|
  spec.name          = "exchangerate"
  spec.version       = Exchangerate::VERSION
  spec.authors = ["Daniel Akinola"]
  spec.email = ["adwakinola@gmail.com"]

  spec.summary = "A gem for getting exchange rates"
  spec.description = "This library provides exchange rates using data from ECB 90-day feed, updated daily and (assuming data can download at least once a day) suitable for offline-use due to data being stored locally"
  spec.homepage = "https://www.github.com/Dakinola892"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = ["lib/exchangerate/rates.xml", "lib/exchangerate.rb", "lib/exchangerate/rate_finder.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
