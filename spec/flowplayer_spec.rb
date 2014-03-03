require 'spec_helper'

describe Flowplayer::Player do
  it "should set options from block" do
    flow_player = Flowplayer::Player.new('my_video', 'commericial.swf') do |player|
      player.fullscreen true
      player.logo(:url => nil, :opacity => 0, :fullscreenOnly => true)
      player.onLoad do
        'this.unmute();'
      end
      player.onStart do |clip|
        'alert(clip.metaData.width);'
      end
    end

    flow_player.options[:fullscreen].should == true
    flow_player.functions[:onLoad].should == 'function() { this.unmute(); }'
    flow_player.functions[:onStart].should == 'function(clip) { alert(clip.metaData.width); }'
    flow_player.options[:logo].should be_an(Hash)

  end

  it "should set the dom_id to 'my_video'" do
    flow_player = Flowplayer::Player.new('my_video', 'commericial.swf') do |player|
      player.fullscreen true
    end
    flow_player.dom_id.should == 'my_video'
  end

  it "should generate valid options" do
    flow_player = Flowplayer::Player.new('my_video', 'commericial.swf') do |player|
      player.fullscreen true
      player.logo({:opacity => 0, :fullscreenOnly => true})
      player.onLoad do
        'this.unmute();'
      end
    end
    flow_player.to_js.should include 'fullscreen'
    flow_player.to_js.should match /^\{.+\}$/
    flow_player.to_js.should include({:opacity => 0, :fullscreenOnly => true}.to_json)
  end

  it "should create script tags with options" do
    flow_player = Flowplayer::Player.new('my_video', 'commericial.swf') do |player|
      player.fullscreen true
      player.logo(:url => nil, :opacity => 0, :fullscreenOnly => true)
      player.onLoad do
        'this.unmute();'
      end
    end
    ["<script", "</script>", "flowplayer(\"my_video\", \"commericial.swf\", #{flow_player.to_js}"].each do |part|
      flow_player.script_tags.should include part
    end
    flow_player.script_tags.should match(/\)\;/)
  end

  it "should raise exception if passed a setter" do
    lambda do
      flow_player = Flowplayer::Player.new('my_video', 'commericial.swf') do |player|
        player.fullscreen = true
      end
    end.should raise_error
  end

  it "should support jquery" do
    flow_player = Flowplayer::Player.new('my_video', 'commericial.swf') do |player|
      player.fullscreen true
      player.logo(:url => nil, :opacity => 0, :fullscreenOnly => true)
    end
    flow_player.should include('$(document).ready(function(){')
  end

  it "should support prototype" do
    flow_player = Flowplayer::Player.new('my_video', 'commericial.swf', 'prototype') do |player|
      player.fullscreen true
      player.logo(:url => nil, :opacity => 0, :fullscreenOnly => true)
    end
    flow_player.should include('document.observe(function(){')
  end
end

