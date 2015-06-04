#!/usr/bin/env python
execfile("pyscripts/pythonscript_API_auth.py")

response = auth_request('GET',
	 '/organization',)
assert(response.status_code == 200)
A = json.loads(response.text)
B = A[0].values()
print B[1]



