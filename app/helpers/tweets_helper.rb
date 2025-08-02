module TweetsHelper
  def find_youtube_url(video)
    return nil if video.nil?

    if video[0..16] == "https://youtu.be/"
      return video[17..27]
      # "https://youtu.be/WGiUk8VakxQ" 11桁のyoutubeのURLが出力されるようにする
    else
      return video[32..42]
      # "https://www.youtube.com/watch?v=WGiUk8VakxQ" 11桁のyoutubeのURLが出力されるようにする
    end
  end

  def find_tweet_id(twitter_url)
   regex = /(twitter\.com|x\.com)\/\w+\/status\/(\d+)/
   match = twitter_url.match(regex)
   match[2] if match
  end

end
