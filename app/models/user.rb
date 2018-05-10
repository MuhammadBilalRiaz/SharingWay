class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friend_requests, dependent: :destroy, foreign_key: :sender_id
  has_many :friend_ships
  has_many :friends, through: :friend_ships
  has_many :posts
  has_many :comments, dependent: :destroy


  def self.search(search)
    if search.present?
      users = User.where('username Like ?',"%#{search}%")
    else
      users = User.all
    end
    users
  end

end
