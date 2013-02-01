module BigosTwitterBox
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a BigosTwitterBox initializer."
      def copy_initializer
        template "bigos_twitter_box.rb", "config/initializers/bigos_twitter_box.rb"
      end

      def create_settings

        Setting["#{BigosTwitterBox.name}.consumer_key"] = "YOUR CONSUMER KEY"
        Setting["#{BigosTwitterBox.name}.consumer_secret"] = "YOUR CONSUMER SECRET"
        Setting["#{BigosTwitterBox.name}.oauth_token"] = "YOUR OAUTH TOKEN"
        Setting["#{BigosTwitterBox.name}.oauth_token_secret"] = "YOUR OAUTH TOKEN SECRET"
        Setting["#{BigosTwitterBox.name}.twitter_login"] = "TWITTER LOGIN"
        Setting["#{BigosTwitterBox.name}.twitter_posts"] = 3
        im = BigosApp::InstalledModule.find_or_create_by_name(BigosTwitterBox.name)
        im.page_element = BigosApp::BigosTwitterBoxElement.name
        im.save
      end
    end
  end
end