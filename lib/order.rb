class Order

  include DataMapper::Resource  #links the class to DataMapper, include Resource module

  property :id, Serial
  property :logo, String, :required => true
  property :hoodie_style, Integer
  property :size, String, :required => true
  property :quantity, Integer, :required => true
  property :email, String, :required => true
  property :created_at, DateTime

  belongs_to :paypal_transaction

end
