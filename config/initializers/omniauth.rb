Rails.application.config.middleware.use OmniAuth::Builder do

  unless Rails.env.production?
    provider :developer
  end

  # provider :foursquare, ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_CLIENT_SECRET']
  # provider :twitter, ENV['TWITTER_CLIENT_KEY'], ENV['TWITTER_CLIENT_SECRET']
end