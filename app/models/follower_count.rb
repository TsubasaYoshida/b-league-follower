class FollowerCount < ApplicationRecord
  paginates_per 10

  belongs_to :team
  validates :count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :latest_to_that_date, ->(date) { where(created_at: ..(date.end_of_day)).order(created_at: :desc) }

  def difference_from_previous_day
    previous_day = team.follower_counts.latest_to_that_date(created_at.to_date - 1).first
    previous_day.present? ? count - previous_day.count : nil
  end
end
