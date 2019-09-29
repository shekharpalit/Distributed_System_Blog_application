#!/usr/bin/env ruby
require 'rinda/tuplespace'

URI = "druby://localhost:61676"
DRb.start_service(URI, Rinda::TupleSpace.new)
DRb.thread.join
