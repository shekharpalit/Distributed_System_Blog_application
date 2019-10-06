#Script to start TupleSpace for Adapting Rinda to XML-RPC

require 'rinda/tuplespace' #Module required to use TupleSpace
require 'drb/drb'

URI = "druby://localhost:12345" #Startting up of a TupleSpace
DRb.start_service(URI, Rinda::TupleSpace.new)
DRb.thread.join
