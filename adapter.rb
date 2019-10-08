#!/usr/bin/env ruby
require 'rinda/rinda'
require 'xmlrpc/server'

server = XMLRPC::Server.new(8003)
ts = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, "druby://localhost:61676"))
DRb.start_service



server.add_handler '_out' do |array_values|
    array_values.each do |t|
      ts.write(t)
    end
    message = "done with data insertion\n"
    String(message)
end


server.add_handler '_rd' do |value_to_matched|
    values = []
    Array(value_to_matched).each do |t|
        if t['class'] == "String"
            values.push(String)
        elsif t['class'] == 'Numeric'
            values.push(Numeric)
        elsif t['regexp'] ==  '^[-+/*]$'
            values.push(%r{^[-+/*]$})
        elsif t['from'] ==  "1, 'to': 10"
            values.push(1..10)
        elsif t['from'] == "'a', 'to': 'z'"
            values.push('a'..'z')
        elsif t['symbol'] == 'chopstick'
            values.push(Chopstick)
        else
            values.push(t)
        end
    end
    # String(values)
    res = ts.read_all(values)
end


server.add_handler '_in' do |value_to_deleted|
    values = []
    Array(value_to_deleted).each do |t|
        if t['class'] == "String"
            values.push(String)
        elsif t['class'] == 'Numeric'
            values.push(Numeric)
        elsif t['regexp'] ==  '^[-+/*]$'
            values.push(%r{^[-+/*]$})
        elsif t['from'] == "1, 'to': 10"
            values.push(1..10)
        elsif t['from'] == "'a', 'to': 'z'"
            values.push('a'..'z')
        elsif t['symbol'] == 'chopstick'
            values.push(Chopstick)
        else
            values.push(t)
        end
    end
    res = ts.take(values)
    String(res)
end


server.add_handler '_read_next' do |value_to_deleted|
    values = []
    result_tuple = []
    Array(value_to_deleted).each do |t|
        if t['class'] == "String"
            values.push(String)
        elsif t['class'] == 'Numeric'
            values.push(Numeric)
        elsif t['regexp'] ==  '^[-+/*]$'
            values.push(%r{^[-+/*]$})
        elsif t['from'] == "1, 'to': 10"
            values.push(1..10)
        elsif t['from'] == "'a', 'to': 'z'"
            values.push('a'..'z')
        elsif t['symbol'] == 'chopstick'
            values.push(Chopstick)
        else
            values.push(t)
        end
    end
    result_tuple = ts.read_all(values)
    value_current = ts.take(result_tuple[0])
    result_tuple = []
    String(value_current)
end

server.serve
