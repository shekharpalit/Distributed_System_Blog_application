import xmlrpc.client
import time
arithmatic_proxy = xmlrpc.client.ServerProxy("http://localhost:8003/", allow_none=True)


tuples_inputs = [["*",10,20], ["+",2,3], ["-",9,3], ["/",136,4]]


#Clear the older arithmatic results in TupleSpace.
# TupleSpace_List = arithmatic_proxy._rd_all([{'class':'String'}, {'class':'Numeric'}])
# for i in range(len(TupleSpace_List)):
#     Result_Taken = arithmatic_proxy._in([{'class':'String'}, {'class':'Numeric'}])
#

# #Writing into TupleSpace
# v = [{'regexp': '^[-+/*]$'},{'class':'Numeric'},{'class':'Numeric'}]
# values_to_read = [{ 'class': 'String' }, { 'class': 'Numeric' }, { 'class': 'Numeric' }]
# print(arithmatic_proxy._out(tuples_inputs))
# # print(arithmatic_proxy._rd_all(values_to_read))

# Taking result from the TupleSpace
for j in range(len(tuples_inputs)):
    arithmatic_result = arithmatic_proxy._in([{'class':'String'}, {'class':'Numeric'}])
    print(arithmatic_result)
