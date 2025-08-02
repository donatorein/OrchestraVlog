class AddVideoToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :video, :string
  end
end
