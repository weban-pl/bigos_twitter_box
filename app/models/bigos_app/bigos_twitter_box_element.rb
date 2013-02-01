module BigosApp
  class BigosTwitterBoxElement < PageElement

    def self.class_name
      "Twitter module"
    end

    def render
      "bigos_twitter_box/item"
    end

    def admin_render
      nil
    end

  end
end
