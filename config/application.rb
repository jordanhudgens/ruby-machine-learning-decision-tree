require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Truckwatcher
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false
  end
end
