namespace :twitter do
  desc 'フォロワー数を取得する'
  task :get_follower_count => :environment do
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.credentials.twitter[:api_key]
      config.consumer_secret = Rails.application.credentials.twitter[:api_secret_key]
      config.access_token = Rails.application.credentials.twitter[:access_token]
      config.access_token_secret = Rails.application.credentials.twitter[:access_token_secret]
    end

    follower_counts = []
    Team.all.each do |team|
      count = client.user(team.twitter_user_id.to_i).followers_count
      follower_counts << team.follower_counts.build(count: count)
    end
    FollowerCount.import follower_counts
  end
end
