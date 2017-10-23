# frozen_string_literal: true

source 'https://rubygems.org'

# Infrastructure
gem 'mongo', '~> 2.4', '>= 2.4.3'
gem 'sinatra', '~> 2.0'

gem 'dry-auto_inject', '~> 0.4.3'
gem 'dry-struct', '~> 0.3.0'
gem 'dry-system', '~> 0.8.1'

group :development do
  gem 'rubocop', require: false

  gem 'rake'

  gem 'minitest'
  gem 'minitest-around'
  gem 'rack-test'
end

group :development, :test do
  gem 'timecop', '~> 0.8.1'
end
