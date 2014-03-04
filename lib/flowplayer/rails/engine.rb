module Flowplayer
  module Rails
    class Engine < ::Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Flowplayer::Rails::Helper)
      end

      initializer "flowplayer.assets.precompile" do |app|
        app.config.assets.precompile += %w(flowplayer.min.js)
        app.config.assets.precompile += %w(*.swf)
      end
    end
  end
end
