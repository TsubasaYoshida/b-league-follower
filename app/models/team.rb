class Team < ApplicationRecord
  has_many :follower_counts
  validates :name, :screen_name, :short_name, presence: true
end
