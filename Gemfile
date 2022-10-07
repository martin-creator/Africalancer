source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server

gem 'puma', '~> 4.1'


# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'bulma-rails', '~>0.7.4'

gem 'bulma-extensions-rails', '~>1.0.30'

gem 'devise', '~> 4.6'

# Use jquery as the JavaScript library
gem 'jquery-rails'

#gem 'toastr-rails', '~>1.0' --we have installed with yarn instead

gem "figaro"

#gem 'omniauth', '=1.9.0.'
gem 'omniauth', '~> 1.9'

#gem 'omniauth-facebook', '=5.0.0'
gem 'omniauth-facebook', '~> 5.0'

gem 'faker', '~> 1.9'

#gem for paging
gem 'kaminari'


gem 'twilio-ruby', '~> 5.71.0'

gem 'stripe', '~> 7.0'

#gem 'stripe', '~> 4.18', '>= 4.18.1'

#supports admin dashboard
gem 'trestle', '~> 0.9.0'

gem 'trestle-auth', '~> 0.4.2'

gem 'trestle-search', '~> 0.4.2'

gem 'trestle-tinymce', '~> 0.3.0'

gem 'activemerchant', '~> 1.117'

# gem 'jquery-ui-rails', '~>5.0'

# gem 'fullcalendar-rails', '~> 2.6', '>= 2.6.1.0'

# gem 'momentjs-rails', '~>2.17.1'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
