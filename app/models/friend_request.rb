class FriendRequest < ApplicationRecord
  belongs_to :user, foreign_key: :sender_id
  belongs_to :sender, class_name: "User",foreign_key: :sender_id
  belongs_to :receiver, class_name: "User",foreign_key: :receiver_id
  belongs_to :friend_ship
  enum status_id: [:pending, :accepted, :rejected]

end
