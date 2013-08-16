class PaypalTransaction

  include DataMapper::Resource  #links the class to DataMapper, include Resource module

  property :id, Serial
  property :payment_status, String#, :required => true
  property :payment_date, DateTime#, :required => true
  property :verify_sign, String, :length => 100#, :required => true  #this may be necessary to include. check paypal resources
  property :business, String#, :required => true
  property :invoice, String  #not sure if we will want this
  property :num_cart_items, Integer
  property :item_name, String#, :required => true     #x is the item in shopping cart
  property :item_number, String#, :required => true  #x is the item in shopping cart
  property :quantity, String#, :required => true     #x is the item in shopping cart
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
  property :items, Text
  # style: Bella, size: M, logo: pdx.rb, qty: 3
  # style: Bella, size: L, logo: pdx.rb, qty: 2
  # style: ITC,   size: M, logo: pdx.rb, qty: 1

  has 1, :order

  def initialize(params)
    # @params = params

    self.filter_params(params)
    # self.update(params)
    # self.order = Order.new(params)
    # Tests for
    #   Creating each model
    #   Filtering params
    #   Associating the models
  end

  def filter_paypal_post(params)
    params.keep_if { |key,value| table_attributes.include?(key) }
    return params
  end

    # params.map do |key,val|
    #   cart_params.map do |attr|
    #     if key.match(attr)
    #       p key + " matches " +attr
    #     end
    #   end
    # end

    # cart_params.each do |attr|
    #   if params.include?(attr)
    #     p attr
    #   end
    # end
  def filter_cart_items(params)
  end

  def table_attributes
    ["payment_status", "payment_date", "verify_sign", "business", "invoice", "num_cart_items", "item_namex", "item_numberx", "quantityx", "last_name",'first_name', 'address_street', 'address_city', 'address_state', 'address_zip', 'mc_gross', 'mc_fee', 'mc_handling', 'mc_shipping']
    # ["payment_status", "payment_date", "business", "invoice", "num_cart_items", "item_name1", "item_number1", "quantity1", "last_name",'first_name', 'address_street', 'address_city', 'address_state', 'address_zip', 'mc_gross', 'mc_fee', 'mc_handling', 'mc_shipping']
  end

  def cart_items
    ["(item_name[0-9]+)", "(item_number[0-9]+)", "(quantity[0-9]+)"]
  end

end