source 'https://rubygems.org/'

gem 'cuba'

gem 'rack-protection'
gem 'redcarpet'
gem 'tilt'
gem 'erubis'

gem 'unicorn'

group :development do
  gem 'guard-rack'
  gem 'rb-inotify'
  gem 'net-ssh'
  gem 'rake'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'

  # Support for ed25519 ssh keys
  gem 'rbnacl', '< 5.0' # TODO: check net-ssh dependency to _unleash_
  gem 'bcrypt_pbkdf'
end

group :test do
  gem 'capybara'
  gem 'cutest'
  gem 'minitest'
end
