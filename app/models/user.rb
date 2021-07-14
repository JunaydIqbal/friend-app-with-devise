class User < ApplicationRecord

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  validate :username_uniqueness

  def username_uniqueness
    self.errors.add(:base, 'User with same username already exists. Please try with another username.') if User.where(:username => self.username).exists?
  end

  # validate :login_failed

  # def login_failed
  #   self.errors.add(:base, 'Invalid username and password') if !User.where(:username => self.username, :password => self.password).exists?
  # end
  
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
