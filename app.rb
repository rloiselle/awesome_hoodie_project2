require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-migrations'
require 'dm-timestamps'

if development?
	DataMapper.setup(:default, "sqlite3:./hoodie_database.sqlite3")
else
	DataMapper.setup(:default, ENV["DATABASE_URL"])
end

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

post '/order_review' do
	@logo = params[:order][:logo]
	@size = params[:order][:size]
	@quantity = params[:order][:quantity].to_i
	@style = params[:order][:style]
	@subtotal = @quantity * 28
	@date = Time.now.asctime
	@image = params[:order][:image]

	erb :order_review
end








