import xmlrpc.client

blog = xmlrpc.client.ServerProxy("http://localhost:8003", allow_none=True)

bob_tuples = [["bob","distsys","I am studying chap 2"], ["bob","distsys","The linda example’s pretty simple"], ["bob","gtcn","Cool Book!!"]]

def operations_for_bob():
    print(blog._out(bob_tuples))

if __name__ == '__main__':
    operations_for_bob()
