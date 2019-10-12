import xmlrpc.client

blog = xmlrpc.client.ServerProxy("http://localhost:8003", allow_none=True)

alice_tuples = [["Alice","gtcn","This graph theory stuff is not easy"], ["Alice","distsys","I like systems more than graphs"]]

def operations_for_Alice():
    print(blog._out(alice_tuples))

if __name__ == '__main__':
    operations_for_Alice()
