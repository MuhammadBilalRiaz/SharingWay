class FriendRequest < ApplicationRecord
  belongs_to :user, foreign_key: :sender_id
  belongs_to :sender, class_name: "User",foreign_key: :sender_id
  belongs_to :receiver, class_name: "User",foreign_key: :receiver_id
  enum status_id: [:pending, :accepted, :rejected]

  after_update :friend_ship_create

  def self.pending_requests(current_user)
    FriendRequest.where(receiver_id: current_user.id, status_id: 'pending')
  end

  def friend_ship_create
    if self.status_id == "accepted"
      FriendShip.transaction do
        FriendShip.create!(user_id: self.receiver_id, friend_id: self.sender_id )
        FriendShip.create!(user_id: self.sender_id, friend_id: self.receiver_id )
      end
    end
  end

  def self.sent_requests(current_user)
    FriendRequest.where(sender_id: current_user.id)
  end



end
