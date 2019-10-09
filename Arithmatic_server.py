import xmlrpc.server
import operator
arithmatic_proxy = xmlrpc.client.ServerProxy("http://localhost:8003/", allow_none=True)

#Below code performs mathematical operation
ops = {
"+": operator.add,
"-": operator.sub,
"*": operator.mul,
"/": operator.truediv}
result_list = []
#Take operand and operator from the TupleSpace
values_to_read = [{'regexp': '^[-+/*]$'},{'class':'Numeric'},{'class':'Numeric'}]
TupleSpace_List = arithmatic_proxy._rd_all(values_to_read)
print(TupleSpace_List, len(TupleSpace_List))
#Writing the arithmatic_result into TupleSpace
for i in range(len(TupleSpace_List)):
    operator, value1, value2 = arithmatic_proxy._in([{'regexp': '^[-+/*]$'}, {'class':'Numeric'}, {'class':'Numeric'}])
    op_func = ops[operator]           #Evaluating arithmatic operator type.
    result=op_func(value1, value2)    #Performing arithmatic operation
    result_list.append(["result", result])
arithmatic_proxy._out(result_list)
