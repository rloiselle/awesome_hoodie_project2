require 'rubygems'
require 'sinatra'
# require 'data_mapper'   #if using, do not need 'dm-migrations'
# require 'awesome_print' # remove gem and when in productive mode. use 'ap object' in irb for pretty printing
require 'dm-core'         #Not needed if using 'datamapper'
require 'dm-migrations'   #Not needed if using 'datamapper'
require 'dm-timestamps'   #Not needed if using 'datamapper'
require 'dm-validations'
require 'dm-sqlite-adapter'
require './paypal'

if development?
  DataMapper.setup(:default, "sqlite3:./hoodie_database.sqlite3")
else
  DataMapper.setup(:default, ENV["DATABASE_URL"])
end

class Order
  include DataMapper::Resource  #links the class to DataMapper, include Resource module
  property :id, Serial
  property :logo, String, :required => true
  property :hoodie_style, Integer
  property :size, String, :required => true
  property :quantity, Integer, :required => true
  property :email, String, :required => true
  property :created_at, DateTime
end

DataMapper.finalize


get '/' do
  # binding.pry
  erb :home
end

get '/hoodie_1' do
  erb :hoodie_1
end

get '/hoodie_2' do
  erb :hoodie_2
end

get '/hoodie_3' do
  erb :hoodie_3
end

get '/hoodie_4' do
  erb :hoodie_4
end

get '/tshirt_1' do
  erb :tshirt_1
end

get '/tshirt_2' do
  erb :tshirt_2
end

get '/orders' do
  @orders = Order.all
  erb :orders
end

get '/order_review/:logo/:size' do
  @logo = params[:logo]
  @size = params[:size]
  erb :order_review
end

post '/order_review/:logo/:size' do
  @logo = params[:logo]
  @size = params[:size]
  erb :order_review
end

post '/ipn' do
  a_hash = params
  # p a_hash.length
  new_trans = PaypalTransaction.new

  def table_attributes
    # ["payment_status", "payment_date", "verify_sign", "business", "invoice", "num_cart_items", "item_name1", "item_number1", "quantity1", "last_name",'first_name', 'address_street', 'address_city', 'address_state', 'address_zip', 'mc_gross', 'mc_fee', 'mc_handling', 'mc_shipping']
    ["payment_status", "payment_date", "business", "invoice", "num_cart_items", "item_name1", "item_number1", "quantity1", "last_name",'first_name', 'address_street', 'address_city', 'address_state', 'address_zip', 'mc_gross', 'mc_fee', 'mc_handling', 'mc_shipping']
  end

  a_hash.keep_if { |key,value| table_attributes.include?(key) }
  # p a_hash.length

  a_hash.map do |key,value|
    new_trans[key] = value
  end

  new_trans.save
  # p new_trans.saved?
  # p new_trans.errors
  if new_trans.saved? #this is not working
    200
  else
    400
  end
end






