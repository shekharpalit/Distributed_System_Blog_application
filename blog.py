#!/usr/bin/env python3
import xmlrpc.client

blog = xmlrpc.client.ServerProxy("http://localhost:8003", allow_none=True)




#input for the bob client
bob_tuples = [["bob","distsys","I am studying chap 2"], ["bob","distsys","The linda example’s pretty simple"], ["bob","gtcn","Cool Book!!"]]
#input for alice client
alice_tuples = [["Alice","gtcn","This graph theory stuff is not easy"], ["Alice","distsys","I like systems more than graphs"]]

#input for chuck to read from the tuplespce
Required_values_for_Chuck = [{ 'class': 'String' },"distsys", { 'class': 'String' }]


def operations_for_bob(bob_tuples):
    print(blog._out(bob_tuples))

def operations_for_Alice(alice_tuples):
    print(blog._out(alice_tuples))

def operations_for_Chuck(Required_values_for_Chuck):
    print(blog._rd(Required_values_for_Chuck))


def operations_for_Chuck_with_read_next(Required_values_for_Chuck):
    print(blog._read_next(Required_values_for_Chuck))

if __name__ == '__main__':
    operations_for_bob(bob_tuples)
    operations_for_Alice(alice_tuples)
    operations_for_Chuck(Required_values_for_Chuck)
    operations_for_Chuck_with_read_next(Required_values_for_Chuck)
