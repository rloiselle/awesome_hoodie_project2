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

post '/ipn' do
  new_trans = PaypalTransaction.new(params)
  new_trans.attributes = params
  new_trans.save
  if new_trans.save #this is not working
    200
  else
    400
  end
end