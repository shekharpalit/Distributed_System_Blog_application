import xmlrpc.client

blog = xmlrpc.client.ServerProxy("http://localhost:8003", allow_none=True)
Required_values_for_Chuck = [{ 'class': 'String' },"distsys", { 'class': 'String' }]

def operations_for_Chuck():
    print(blog._rd(Required_values_for_Chuck))


def operations_for_Chuck_with_read_next():
    print(blog._read_next(Required_values_for_Chuck))


if __name__ == '__main__':
    operations_for_Chuck()
    operations_for_Chuck_with_read_next()
