# app/models/user.rb
require 'bcrypt'

class User
  include ActiveModel::Model
  include BCrypt

  attr_accessor :id, :username, :password_digest

  def self.create(attributes)
    new(attributes).save
  end

  def save
    return false unless valid?

    self.id = SecureRandom.uuid
    self.password_digest = BCrypt::Password.create(password_digest)
    self.class.users << self
    true
  end

  def self.find_by_username(username)
    users.find { |user| user.username == username }
  end

  def authenticate(password)
    BCrypt::Password.new(password_digest) == password
  end

  private

  def self.users
    @users ||= []
  end

  def valid?
    username.present? && password_digest.present?
  end
end
