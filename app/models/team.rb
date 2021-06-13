class Team < ApplicationRecord
  has_many :follower_counts
  validates :name, :screen_name, :short_name, :twitter_user_id, presence: true

  def today_and_yesterday_follower_count
    today = follower_counts.latest_to_that_date(Date.current).first
    yesterday = follower_counts.latest_to_that_date(today.created_at.to_date - 1).first
    { today: today.count, yesterday: yesterday.count }
  end

  def updown_last_ten_days
    current = follower_counts.order(created_at: :desc).first
    ten_days_ago_range = current.created_at.ago(10.day).all_day
    ten_days_ago = follower_counts.where(created_at: ten_days_ago_range).first
    ten_days_ago ? current.count - ten_days_ago.count : nil
  end
end
