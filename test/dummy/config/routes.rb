Rails.application.routes.draw do

  mount BigosTwitterBox::Engine => "/bigos_twitter_box"
  root :to=>"test#index"
end
