class FollowerCount < ApplicationRecord
  belongs_to :team
  validates :count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end