require 'carrierwave'
class User < ActiveRecord::Base
  has_and_belongs_to_many :course

  mount_uploader :avatar, AvatarUploader

  has_secure_password

  validates :password, length: { minimum: 6 }
  validates :name,  presence: true, length: { maximum: 50 }

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end