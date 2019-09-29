#!/usr/bin/env ruby
require 'rinda/rinda'

URI = "druby://localhost:61676"
DRb.start_service
ts = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, URI))
loop do
  # ops, a, b = ts.take([ %r{^[-+/*]$}, Numeric, Numeric])
  author, title, topic = ts.take([String, String, String])
  ts.write([author, title, topic])
end
