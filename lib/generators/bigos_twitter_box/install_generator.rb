module BigosTwitterBox
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a BigosTwitterBox initializer."
      def copy_initializer
        template "bigos_twitter_box.rb", "config/initializers/bigos_twitter_box.rb"
      end

      def create_settings

        Setting["GS.twitter_consumer_key"] = "YOUR CONSUMER KEY" if Setting.find_by_var("GS.twitter_consumer_key").blank?
        Setting["GS.twitter_consumer_secret"] = "YOUR CONSUMER SECRET" if Setting.find_by_var("GS.twitter_consumer_secret").blank?
        Setting["GS.twitter_oauth_token"] = "YOUR OAUTH TOKEN" if Setting.find_by_var("GS.twitter_oauth_token").blank?
        Setting["GS.twitter_oauth_token_secret"] = "YOUR OAUTH TOKEN SECRET" if Setting.find_by_var("GS.twitter_oauth_token_secret").blank?

        Setting["#{BigosTwitterBox.name}.twitter_login"] = "TWITTER LOGIN"
        Setting["#{BigosTwitterBox.name}.twitter_posts"] = 3
        im = BigosApp::InstalledModule.find_or_create_by_name(BigosTwitterBox.name)
        im.page_element = BigosApp::BigosTwitterBoxElement.name
        im.save
      end
    end
  end
end