module Flowplayer
  module Rails
    class Engine < ::Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Flowplayer::Rails::Helper)
      end
    end
  end
end
