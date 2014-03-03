class String
  def html_safe
    self
  end
end

describe Flowplayer::Rails::Helper do
  include Flowplayer::Rails::Helper



  it "should render player" do
    flow_player = flowplayer_for('my_video', 'commericial.swf') do |player|
      player.fullscreen true
      player.logo(:url => nil, :opacity => 0, :fullscreenOnly => true)
    end
    flow_player.should include('$(document).ready(function() {')
  end



  it "should support prototype" do
    flow_player = flowplayer_for('my_video', 'commericial.swf', 'prototype') do |player|
      player.fullscreen true
      player.logo(:url => nil, :opacity => 0, :fullscreenOnly => true)
    end
    flow_player.should include('document.observe("dom:loaded", function() {')
  end

end
