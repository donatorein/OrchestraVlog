class TweetsController < ApplicationController

#追加箇所
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @tweets = Tweet.all
    all_tweets = Tweet.includes(:user).order(created_at: :desc)
    @top_liked_tweets = all_tweets.sort_by { |t| -t.likes.count }.first(6)
    @recent_tweets = all_tweets.reject { |t| @top_liked_tweets.include?(t) }
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)

    tweet.user_id = current_user.id

    if tweet.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])

    @comments = @tweet.comments
    @comment = Comment.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :about, :genre, :video, :twitter_url, :image)
  end

end