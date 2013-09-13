source 'https://rubygems.org'
ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'rails_12factor', group: :production

# Data
gem 'sqlite3', group: :development
gem 'pg'
gem 'addressable'

# Views
gem 'haml-rails', github: 'indirect/haml-rails', branch: 'master'

# Assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bourbon'
gem 'neat'

# Auth
gem 'omniauth'
gem 'omniauth-google-oauth2'
# gem 'omniauth-twitter'
# gem 'omniauth-identity'

# Config
gem "dotenv-rails"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem "sqlite3"
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "awesome_print"
  gem "faker"
end

group :test do
  gem "fivemat"
  gem "timecop"
  gem "putsinator"
  gem "webmock"
end

group :development do
  gem "annotations"
  # gem "foreman"
end

group :production do
  gem "unicorn"
end
