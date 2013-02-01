require "bigos_twitter_box/engine"
require "twitter"

module BigosTwitterBox

  mattr_accessor :consumer_key
  @@consumer_key = nil

  mattr_accessor :consumer_secret
  @@consumer_secret = nil

  mattr_accessor :oauth_token
  @@oauth_token = nil

  mattr_accessor :oauth_token_secret
  @@oauth_token_secret = nil

  mattr_accessor :twitter_login
  @@twitter_login = nil

  mattr_accessor :twitter_posts
  @@twitter_posts = 3

  module Controllers
    autoload :Helpers, 'bigos_twitter_box/controllers/helpers'
  end


  def self.setup
    include_helpers
    yield self
  end

  # Include helpers to AC and AV.
  def self.include_helpers
    ActiveSupport.on_load(:action_controller) do
    end

    ActiveSupport.on_load(:action_view) do
      include BigosTwitterBox::Controllers::Helpers
    end
  end
end
