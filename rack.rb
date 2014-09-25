# -*- coding: utf-8 -*-

require 'sinatra'
require 'sinatra/reloader'

configure do
  # load helpers
  Dir.glob(File.join(File.expand_path('../lib', __FILE__), '*.rb')).each do |file|
    require file
  end
end

get '/' do
  ip = request.ip
  referrer = request.referrer || "empty"
  user_agent = request.user_agent
  
  erb :rack_api, locals: { ip: ip, referrer: referrer, user_agent: user_agent}
end
