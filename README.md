# Flowplayer::Rails

This gem provides flowplayer flash player for your Rails application.

## Installation

Add this line to your application's Gemfile:

    gem 'flowplayer-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flowplayer-rails

## Usage

    <a id='video' style='display:block;width:512px;height312px;'>

  For JQuery

    = flowplayer_for :video, '/flowplayer.swf', 'jquery' do |player|
      - player.playlist [{:url => "video_still.jpg" }, {:url => "video_512x288.flv", :autoPlay => false, :autoBuffering => true }]
      - player.onLoad do
        - 'this.unmute();'
  For Prototype

    = flowplayer_for :video, '/flowplayer.swf', 'prototype' do |player|
      - player.playlist [{:url => "video_still.jpg" }, {:url => "video_512x288.flv", :autoPlay => false, :autoBuffering => true }]
      - player.onLoad do
        - 'this.unmute();'

## Configs are the same ones here

  http://flowplayer.org/documentation/api/index.html

## Contributing

1. Fork it ( http://github.com/<my-github-username>/flowplayer-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
