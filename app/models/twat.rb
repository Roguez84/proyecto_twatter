class Twat < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :name, presence: true
  def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
  end

end
