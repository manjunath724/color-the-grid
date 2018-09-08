class Square < ApplicationRecord
  belongs_to :color
  belongs_to :user, optional: true

  validates :color, :username, presence: true

  # Check whether a square is owned by any user
  def can_be_colored?
    self.user_id.nil?
  end

  # Check whether a square is owned by the user
  def is_owned_by?(user_id)
    self.user_id == user_id
  end
end
