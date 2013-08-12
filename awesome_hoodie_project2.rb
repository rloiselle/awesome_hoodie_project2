require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-migrations'
require 'dm-timestamps'

DataMapper.setup(:default, "sqlite3:./hoodie_database.sqlite3")

class Order
	include DataMapper::Resource
	property :id, Serial
	property :logo, String, :required => true
	property :hoodie_style, Integer
	property :size, String, :required => true
	property :quantity, Integer, :required => true
	property :email, String, :required => true
	property :created_at, DateTime
end

DataMapper.finalize


use Rack::Auth::Basic, "Protected Area" do |username, password|
	username == "admin" && password == "hatsandpants"
end

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








