class User < ApplicationRecord

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  
  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login1 = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login1.strip.downcase}]).first
  end
  # attr_writer :login

  # def login
  #   @login || self.username || self.email
  # end

  # validate :validate_username

  # def validate_username
  #   if User.where(email: username).exists?
  #     errors.add(:username, :invalid)
  #   end
  # end
  

end
