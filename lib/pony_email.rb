# From https://github.com/benprew/pony
# Pony.mail({
#   :to => 'you@example.com',
#   :via => :smtp,
#   :via_options => {
#     :address              => 'smtp.gmail.com',
#     :port                 => '587',
#     :enable_starttls_auto => true,
#     :user_name            => 'user',
#     :password             => 'password',
#     :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
#     :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
#   }
# })

# Chuck's example
class Email
  def initialize
    Pony.options = { :from => 'noreply@example.com', :via => :smtp, :via_options => { :host => 'smtp.yourserver.com' } }
  end

  def self.email_admins
    opts = {
      :to => ['connie@iconartistry.com', 'erica@hatsnpants.com'],
      :from => 'me@example.com',
      :subject => 'hi',
      :body => 'Hello there.'}

    Pony.mail(opts)
  end

  def self.email_customer(order)
    opts = {
      :to => order.user_email,
      :from => 'me@example.com',
      :subject => 'hi',
      :body => 'Hello there.'}

    Pony.mail(opts)
  end
end