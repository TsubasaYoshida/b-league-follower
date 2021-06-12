class TeamsController < ApplicationController
  def index
    today_or_yesterday = if FollowerCount.where(created_at: Date.current.all_day).exists?
                           Date.current.all_day
                         else
                           (Date.current - 1).all_day
                         end
    @teams = Team.joins(:follower_counts)
                 .where('follower_counts.created_at': today_or_yesterday)
                 .order('follower_counts.count': :desc)
  end
end
