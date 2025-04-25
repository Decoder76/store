class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
 
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  # Alias for email_address
  def email
    email_address
  end

  def email=(value)
    self.email_address = value
  end
  
end
