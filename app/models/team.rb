class Team < ApplicationRecord
  has_many :follower_counts
  validates :name, :screen_name, :short_name, :twitter_user_id, presence: true

  def today_and_yesterday_follower_count
    if follower_counts.where(created_at: Date.current.all_day).exists?
      today_count = follower_counts.where(created_at: Date.current.all_day).first.count
      yesterday_count = follower_counts.where(created_at: ..(Date.current - 1).end_of_day).order(created_at: :desc).first.count
    else
      today = follower_counts.where(created_at: ..(Date.current - 1).end_of_day).order(created_at: :desc).first
      today_count = today.count
      yesterday_count = follower_counts.where(created_at: ..(today.created_at.to_date - 1).end_of_day).order(created_at: :desc).first.count
    end
    { today: today_count, yesterday: yesterday_count }
  end
end
