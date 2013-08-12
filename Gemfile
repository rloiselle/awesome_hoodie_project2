# Gemfile

source 'https://rubygems.org'

gem "sinatra"
gem "sqlite3"
gem 'dm-core'
gem 'dm-migrations'
gem 'dm-timestamps'

group :production do
	gem "pg"
	gem "dm-postgres-adapter"
end

group :development do
	gem "shotgun"
	gem 'dm-sqlite-adapter'
end