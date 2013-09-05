# config.ru
require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require './app.rb'

run Sinatra::Application


if development?
  DataMapper.setup(:default, "sqlite3:./db/hoodie_database.sqlite3")
else
  DataMapper.setup(:default, ENV["DATABASE_URL"])
end

require './lib/paypal_transaction'
require './lib/order'
require './newrelic.yml'

DataMapper.auto_upgrade!
DataMapper.finalize