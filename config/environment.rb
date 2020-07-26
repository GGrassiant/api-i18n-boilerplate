# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.config.hosts << ENV['CLIENT_HOST']
