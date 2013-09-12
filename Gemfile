source 'https://rubygems.org'

ruby '2.0.0'

gem 'sinatra'

gem 'dm-core'
gem 'dm-migrations'
gem 'dm-timestamps'

group :production do
  gem 'pg'
  gem 'dm-postgres-adapter'
end

group :development do
	gem 'shotgun'
  gem 'dm-sqlite-adapter'
  gem 'sqlite3'
end

group :development, :test do
  gem 'rspec'
  gem 'guard'
  gem 'guard-rspec'
end

gem 'newrelic_rpm'
# gem 'mongrel'