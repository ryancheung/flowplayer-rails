require 'rails'

# Supply generator for Rails 3.0.x or if asset pipeline is not enabled
if ::Rails.version < "3.1" || !::Rails.application.config.assets.enabled
  module Flowplayer
    module Generators
      class InstallGenerator < ::Rails::Generators::Base

        desc "This generator installs flowplayer #{Flowplayer::Rails::FLOWPLAYER_VERSION} and its flash assets"
        source_root File.expand_path('../../../../../vendor/assets', __FILE__)

        def copy_js
          say_status("copying", "flowplayer (#{Flowplayer::Rails::FLOWPLAYER_VERSION})", :green)
          copy_file "javascripts/flowplayer.min.js", "public/javascripts/flowplayer.min.js"
        end

        def copy_flash
          say_status("copying", "flowplayer (#{Flowplayer::Rails::FLOWPLAYER_VERSION}) flash assets", :green)
          copy_file "flash/flowplayer-3.2.18.swf", "public/flash/flowplayer-3.2.18.swf"
          copy_file "flash/flowplayer.controls-3.2.16.swf", "public/flash/flowplayer.controls-3.2.16.swf"
        end

      end
    end
  end
else
  module Flowplayer
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        desc "Just show instructions so people will know what to do when mistakenly using generator for Rails 3.1 apps"

        def do_nothing
          say_status("deprecated", "You are using Rails 3.1 with the asset pipeline enabled, so this generator is not needed.")
          say_status("", "The necessary files are already in your asset pipeline.")
          say_status("", "Just add `//= require jquery` and `//= require jquery_ujs` to your app/assets/javascripts/application.js")
          say_status("", "If you upgraded your app from Rails 3.0 and still have jquery.js, rails.js, or jquery_ujs.js in your javascripts, be sure to remove them.")
          say_status("", "If you do not want the asset pipeline enabled, you may turn it off in application.rb and re-run this generator.")
          # ok, nothing
        end
      end
    end
  end
end
