class Friend < ApplicationRecord
  belongs_to :user
  #scope :tweets_for_me, -> {where("user_id == ?", user.id)}
end
