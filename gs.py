#!/usr/bin/env python3
import xmlrpc.server
import operator
proxy = xmlrpc.client.ServerProxy("http://localhost:8000/",allow_none=True)

ops = {
"+": operator.add,
"-": operator.sub,
"*": operator.mul,
"/": operator.truediv}

#Take operation
l=proxy._rda()
print(l,len(l))
r=[]
result=0

for i in range(len(l)):
    op,x,y= proxy._in([{'regexp': '^[-+/*]$'},{'class':'Numeric'},{'class':'Numeric'}])
    #print(x,op,y)
    op_func = ops[op]
    result=op_func(x,y)
    proxy._out(["result",result])


#proxy._out(["result",21])
proxy._rda()
#proxy._ins()
#_out->write
#_in->take
#rd->read
