#!/usr/bin/env ruby
require 'rinda/rinda'
require 'xmlrpc/server'

server = XMLRPC::Server.new(8002)
ts = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, "druby://localhost:61676"))
DRb.start_service



server.add_handler '_in' do |array_values|
    array_values.each do |t|
      ts.write(t)
    end
end


server.add_handler '_rd' do |value_to_matched|
    res = ts.read([value_to_matched[0], value_to_matched[1], String])
    String(res)
end


server.add_handler '_out' do |value_to_deleted|
    res = ts.take([value_to_deleted[0], value_to_deleted[1], String])
    String(res)
end

server.serve
