class Like < ApplicationRecord
  belongs_to :user
  belongs_to :twat
  validates :user_id, uniqueness: {scope: :twat_id}
end
