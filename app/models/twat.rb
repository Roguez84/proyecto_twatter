class Twat < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :name, presence: true
  def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
  end
  #scope :tweets_for_me, -> {where("user_id IN (?)", Friend.select(:friend_id).where(user_id:current_user.id)  )}
  scope :tweets_for_me, -> (current_user){where("user_id IN (?)", Friend.select(:friend_id).where(user_id:current_user))}
end
