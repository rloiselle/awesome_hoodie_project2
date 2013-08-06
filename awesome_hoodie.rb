require 'rubygems'
require 'sinatra'
# require 'datamapper'

# DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/recall.rb")

# class Order
# 	include DataMapper::Resource
# 	property :id, Serial
# 	property :logo, String, :required => true
# 	property :hoodie_style, Integer, :required => true
# 	property :size, String, :required => true
# 	property :quanity, Integer, :required => true
# 	property :email, String, :required => true
# 	property :created_at, DateTime
# end

# DataMapper.finalize.auto_upgrade!

get '/' do
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

get '/order_review' do
  erb :order_review
end

get '/thank_you' do
  erb :thank_you
end





