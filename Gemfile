ruby '2.0.0'
source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'pg'

group :assets do
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  # rspec-rails needs to be in both development and test environments because it uses generators. Read the Rspec docs: https://github.com/rspec/rspec-rails
  gem 'rspec-rails'
end

group :test do
  # shoulda-matchers provides Rspec with one-liners that test common Rails functionality. These tests would otherwise be much longer, more complex, and error-prone. Read the docs: https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers'
  # A library for setting up Ruby objects as test data. Read the docs: https://github.com/thoughtbot/factory_girl_rails
  gem 'factory_girl_rails'
  gem 'faker', '1.3.0'
  # Capybara helps you test web applications by simulating how a real user would interact with your app. Read the docs: https://github.com/jnicklas/capybara
  gem 'capybara'
  # browser automation framework, read the docs: http://docs.seleniumhq.org/
  gem 'selenium-webdriver'
  # we will use this to clean our testing database after each run. Read the docs: https://github.com/bmabey/database_cleaner
  gem 'database_cleaner'
end

gem 'jquery-rails'
