require 'rubygems'
require 'sinatra'
require 'datamapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/recall.rb")

class Order
	include DataMapper::Resource
	property :id, Serial
	property :logo, String, :required => true
	property :hoodie_style, Integer, :required => true
	property :size, String, :required => true
	property :quanity, Integer, :required => true
	property :email, String, :required => true
	property :created_at, DateTime
end

DataMapper.finalize.auto_upgrade!