require 'json'

module Flowplayer
  class Player
    attr_accessor :options, :functions, :dom_id, :swf
    def initialize(dom_id, swf, lib='jquery', &block)
      @dom_id, @swf, @lib = dom_id, swf, lib
      @options = {}
      @functions = {}
      block.call(self)
      self
    end

    def to_js
      json = options_to_javascript
      json += functions_to_javascript
      "{#{json.join(', ')}}"
    end

    def script_tags
      final = library("flowplayer(\"#{dom_id}\", #{swf.to_json}, #{to_js});")
      <<-EOS
        <script type='text/javascript'>
          //<![CDATA[
              #{final}
          //]]>
        </script>
      EOS
    end

    def library(func)
      case @lib
        when 'jquery'
          jquery(func)
        when 'prototype'
          prototype(func)
      end
    end

    def jquery(func)
      <<-EOS
      $(document).ready(function() {
        #{func}
      });
      EOS
    end

    def prototype(func)
      <<-EOS
        document.observe("dom:loaded", function() {
          #{func}
        });
      EOS
    end

    def only_play_button!(opts = {})
      options[:plugins] ||= {}
      options[:plugins][:controls] ||= {}
      hash = {
          :mute => false,
          :slowForward => false,
          :time => false,
          :slowBackwards => false,
          :volume => false,
          :scrubber => false,
          :stop => false,
          :fullscreen => false,
          :play => true
      }
      hash.merge!(opts)
      options[:plugins][:controls].merge!(hash)
    end


    private

    def functions_to_javascript
      functions.map {|option, function| "\"#{option}\":#{function}"}
    end

    def options_to_javascript
      options.map do |option, value|
        "\"#{option}\":#{value.to_json}"
      end
    end

    def method_missing(method, *args, &block)
      raise "Setters are not supported use method('whatever') to set configs" if /\=$/.match(method.to_s)
      if block.nil?
        options[method] = args.first
      else
        params = block.parameters.collect {|param| param[1]}
        functions[method] = "function(#{params.join(", ")}) { #{block.call.gsub(/\;$/, '')}; }"
      end
      return method
    end

  end
end
