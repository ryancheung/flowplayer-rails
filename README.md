# Flowplayer::Rails

This gem provides flowplayer flash player for your Rails application.

http://flowplayer.org/

## Installation

Add this line to your application's Gemfile:

    gem 'flowplayer-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flowplayer-rails

## Usage

    <a id='video' href="video_url.mp4" style='display:block; width:480px; height:400px;'>

  For JQuery

    <%= flowplayer_for :video, asset_path('flowplayer-3.2.18.swf'), 'jquery' do |player| %>
      <% player.clip autoPlay: true, autoBuffering: true, scaling: "fit" %>
      <% player.play replayLabel: nil, opacity: 0 %>
      <% player.canvas backgroundColor: "transparent", backgroundGradient: "none" %>
      <% player.plugins controls: { backgroundColor: "rgba(239, 239, 239, 0.1)", backgroundGradient: "none", all: false, scrubber: true, play: true, mute: true, fullscreen: true, autoHide: "always", height: "20px"} %>
      <% player.onLoad do %>
        <% 'this.unmute();' %>
      <% end %>
    <% end %>

  For Prototype

    <%= flowplayer_for :video, asset_path('flowplayer-3.2.18.swf'), 'prototype' do |player| %>
      <% player.clip autoPlay: true, autoBuffering: true, scaling: "fit" %>
      <% player.play replayLabel: nil, opacity: 0 %>
      <% player.canvas backgroundColor: "transparent", backgroundGradient: "none" %>
      <% player.plugins controls: { backgroundColor: "rgba(239, 239, 239, 0.1)", backgroundGradient: "none", all: false, scrubber: true, play: true, mute: true, fullscreen: true, autoHide: "always", height: "20px"} %>
      <% player.onLoad do %>
        <% 'this.unmute();' %>
      <% end %>
    <% end %>

## Configs are the same ones here

  http://flowplayer.org/documentation/api/index.html

## Contributing

1. Fork it ( http://github.com/<my-github-username>/flowplayer-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
