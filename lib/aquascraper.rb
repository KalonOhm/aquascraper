# frozen_string_literal: true

require_relative "aquascraper/version"
require_relative "cli.rb"
require_relative "fish_facts.rb"
require_relative "freshwater.rb"
require_relative "brackish_water.rb"
require_relative "saltwater.rb"
require_relative "fish_scraper.rb"

module Aquascraper
  class Error < StandardError; end
  # Your code goes here...
end
