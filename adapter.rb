#!/usr/bin/env ruby
require 'rinda/rinda'
require 'xmlrpc/server'  #import depedences

server = XMLRPC::Server.new(8003) #create a XML RPC server
XMLRPC::Config::ENABLE_NIL_PARSER = true #allow true for Null values
ts = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, "druby://localhost:61676")) #connet with the Rinda tuple space
DRb.start_service


#This handler will take input as a list of lists from the client application
server.add_handler '_out' do |array_values| #handler for adding elements into the tuplespace
    array_values.each do |t|
      ts.write(t)
    end
    message = "done with data insertion\n"
    String(message)
end

#This handler will take input as a list from the client application
server.add_handler '_rd' do |value_to_matched| #handler for read elements from the tuplespace
    values = []  #this will create the input for the tuple space from the input list 
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
    result = ts.read(values)
    String(result)
end

#This handler will take input as a list from the client application
server.add_handler '_in' do |value_to_deleted| #handler for take/delete elements from the tuplespace
    values = []  #this will create the input for the tuple space from the input list
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
    result = ts.take(values)
    String(result)
end

#This handler will take input as a list from the client application
server.add_handler '_read_next' do |value_to_deleted| #handler for read the next elements from the tuplespace
    values = []  #this will create the input for the tuple space from the input list
    result_tuple = [] #hold all the tuplespce results
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
