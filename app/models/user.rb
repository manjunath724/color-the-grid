class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :set_username

  private
    # Construct username with email id and a random number
    def set_username
      self.username = "#{self.email.split('@').first}#{Faker::Number.number(3)}"
    end
end
