#!/usr/bin/env ruby

require 'xmlrpc/server'
require 'rinda/rinda'
require 'drb/drb'
require 'rinda/tuplespace'

#DRb.start_service

server=XMLRPC::Server.new(8000)
XMLRPC::Config::ENABLE_NIL_PARSER = true
DRb.start_service
ts = DRbObject.new_with_uri("druby://localhost:12345")


#Write
server.add_handler '_out' do |tv|
  ts.write(tv)
  tv
end

server.add_handler '_in' do|tv|
  res=[]
  Array(tv).each do |t|
        if t['class'] == "String"
            res.push(String)
        elsif t['class'] == 'Numeric'
            res.push(Numeric)
        elsif t['regexp'] ==  '^[-+/*]$'
            res.push(%r{^[-+/*]$})
        else
            res.push(tv)
        end
    end
    res = ts.take(res)
    String(res)
  res
end

server.add_handler '_rda' do
  #ts.take([nil,nil,nil])
  tsatus=ts.read_all([nil,nil,nil])
  print "TupleSpace status _rda",tsatus
  tsatus
end

server.serve
