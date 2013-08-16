require 'bundler'
Bundler.require(:default, :test)

DataMapper.setup(:default, "sqlite3:./db/test.sqlite3")

require './lib/paypal_transaction'
require './lib/order'

DataMapper.auto_upgrade!
DataMapper.finalize

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end