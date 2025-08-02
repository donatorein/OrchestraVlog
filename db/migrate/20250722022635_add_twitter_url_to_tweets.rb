class AddTwitterUrlToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :twitter_url, :string
  end
end
