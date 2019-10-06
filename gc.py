#!/usr/bin/env python3
import xmlrpc.client
import time
proxy = xmlrpc.client.ServerProxy("http://localhost:8000/",allow_none=True)

#proxy._in()

tuples=[["*",2,2],["+",2,3]] #,["-",9,3]]
#proxy._out(["*",99,99])


for i in tuples:
    print(i)
    proxy._out(i)

for j in range(2):
    res=proxy._in([{'class':'String'},{'class':'Numeric'}])
    print(res)

#Testing

proxy._rda()
#_out->write
#_in->take
#rd->read
#rd->read_all
