# frozen_string_literal: true

require 'simplecov'
require 'faraday'
require 'webmock/rspec'
require 'kinescope'

SimpleCov.start

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(SimpleCov::Formatter::HTMLFormatter)

Dir['./spec/support/**/*.rb'].sort.each do |file|
  require file
end

RSpec.configure do |config|
  config.order = :random
  config.include StubRequestHelpers
end