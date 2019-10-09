import xmlrpc.client

arithmatic_proxy = xmlrpc.client.ServerProxy("http://localhost:8003/", allow_none = True)


tuples_inputs = [["*", 10, 20], ["+", 2, 3], ["-", 9, 3], ["/", 136, 4]]


print(arithmatic_proxy._out(tuples_inputs))

# Taking result from the TupleSpace
for j in range(len(tuples_inputs)):
    arithmatic_result = arithmatic_proxy._in([{'class': 'String'}, {'class': 'Numeric'}])
    print(arithmatic_result)
