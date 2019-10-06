#!/usr/bin/env python3
import xmlrpc.client

blog = xmlrpc.client.ServerProxy("http://localhost:8002")

bob_tuples = [["bob","distsys","I am studying chap 2"], ["bob","distsys","The linda example’s pretty simple"], ["bob","gtcn","Cool Book!!"]]
alice_tuples = [["Alice","gtcn","This graph theory stuff is not easy"], ["Alice","distsys","I like systems more than graphs"]]
Required_values_for_Chuck = [{ 'class': 'String' },"distsys", { 'class': 'String' }]


# def operations_for_bob(bob_tuples):
#     print(blog._out(bob_tuples))
#
# def operations_for_Alice(alice_tuples):
#     print(blog._out(alice_tuples))

def operations_for_Chuck(Required_values_for_Chuck):
    print((blog.test(Required_values_for_Chuck)))



if __name__ == '__main__':
    # operations_for_bob(bob_tuples)
    # operations_for_Alice(alice_tuples)
    operations_for_Chuck(Required_values_for_Chuck)
