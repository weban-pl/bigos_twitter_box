module BigosTwitterBox
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      def bigos_twitter_box_widget(max_tag_id = nil)

        Twitter.configure do |config|
          config.consumer_key = Setting["#{BigosTwitterBox.name}.consumer_key"]
          config.consumer_secret = Setting["#{BigosTwitterBox.name}.consumer_secret"]
          config.oauth_token = Setting["#{BigosTwitterBox.name}.oauth_token"]
          config.oauth_token_secret = Setting["#{BigosTwitterBox.name}.oauth_token_secret"]
        end


        posts = Twitter.user_timeline(
            Setting["#{BigosTwitterBox.name}.twitter_login"],
            :count => Setting["#{BigosTwitterBox.name}.twitter_posts"]
        )
        render :partial=>"bigos_twitter_box/module/widget", :locals=>{:posts => posts}
      end

    end
  end
end