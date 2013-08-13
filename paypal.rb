require 'data_mapper'

DataMapper.setup(:default, "sqlite3:./hoodie_database.sqlite3")

class PaypalTransaction
  include DataMapper::Resource  #links the class to DataMapper, include Resource module
  property :id, Serial
  property :payment_status, String#, :required => true
  property :payment_date, DateTime#, :required => true
  # property :verify_sign, String, :length => 100#, :required => true  #this may be necessary to include. check paypal resources
  property :business, String#, :required => true
  property :invoice, String  #not sure if we will want this
  property :num_cart_items, Integer
  property :item_name1, String#, :required => true     #x is the item in shopping cart
  property :item_number1, String#, :required => true  #x is the item in shopping cart
  property :quantity1, Integer#, :required => true     #x is the item in shopping cart
  #more variables maybe added with button variables
  property :last_name, String#, :required => true
  property :first_name, String#, :required => true
  property :address_street, String  #replace with info from shipping api?
  property :address_city, String    #replace with info from shipping api?
  property :address_state, String   #replace with info from shipping api?
  property :address_zip, Integer    #replace with info from shipping api?
  property :mc_gross, Float#, :required => true
  property :mc_fee, Float#, :required => true
  property :mc_handling, Float#, :required => true
  property :mc_shipping, Float#, :required => true
  #Also available is a per item account of fees/amounts

end

# DataMapper.auto_migrate!  #auto create tables if they don't exist already
DataMapper.auto_upgrade!
DataMapper.finalize   #check integrity of class, call before app interacts with any classes
