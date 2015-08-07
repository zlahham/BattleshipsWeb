require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib/battleships_web.rb')

map "/public" do
  run Rack::Directory.new("./public")
end

run BattleshipsWeb