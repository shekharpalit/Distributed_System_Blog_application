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
    message = "done with data insertion\n"
    String(message)
end


server.add_handler '_rd' do |value_to_matched|
    values = []
    Array(value_to_deleted).each do |t|
        if t['class'] == "String"
            values.push(String)
        elsif t['class'] == 'Numeric'
            values.push(Numeric)
        elsif t['regexp'] ==  '^[-+/*]$'
            values.push(%r{^[-+/*]$})
        else
            values.push(t)
        end
    end
    res = ts.read(values)
    String(res)
end


server.add_handler '_out' do |value_to_deleted|
    values = []
    Array(value_to_deleted).each do |t|
        if t['class'] == "String"
            values.push(String)
        elsif t['class'] == 'Numeric'
            values.push(Numeric)
        elsif t['regexp'] ==  '^[-+/*]$'
            values.push(%r{^[-+/*]$})
        else
            values.push(t)
        end
    end
    res = ts.take(values)
    String(res)
end

server.serve
