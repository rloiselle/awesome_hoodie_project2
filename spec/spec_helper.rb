require 'bundler'
Bundler.require(:default, :test)

DataMapper.setup(:default, "sqlite3:./db/test.sqlite3")

require './lib/paypal_transaction'
require './lib/order'

DataMapper.auto_upgrade!
DataMapper.finalize