#!/usr/bin/env ruby
require 'rinda/rinda'
require 'drb/drb'

URI = "druby://localhost:61676"
DRb.start_service
ts = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, URI))

# loop do
#   res = ts.read([String, "distsys", String])
#   puts res
# end

res = ts.read([String, "l", String])
if res[1] == " "
     puts "hkee"
end

bob_tuples = [["bob","distsys","I am studying chap 2"], ["bob","distsys","The linda example’s pretty simple"], ["bob","gtcn","Cool Book!!"]]
bob_tuples.each do |t|
  ts.write(t)
  # res = ts.take([nil, nil, nil])
  # puts "#{res}"
end

alice_tuples = [["Alice","gtcn","This graph theory stuff is not easy"], ["Alice","distsys","I like systems more than graphs"]]
alice_tuples.each do |t|
  ts.write(t)
  # res = ts.take([nil, nil, nil])
  # puts "#{res}"
end

# require 'rinda/rinda'
#
# URI = "druby://localhost:61676"
# DRb.start_service
# ts = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, URI))
# loop do
#   # ops, a, b = ts.take([ %r{^[-+/*]$}, Numeric, Numeric])
#   res = ts.take([String, "distsys", String])
#   puts res
# end
