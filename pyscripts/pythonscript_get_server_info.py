#!/usr/bin/env python
execfile("pyscripts/pythonscript_API_auth.py")

response = auth_request('GET',
	 '/status',)
assert(response.status_code == 200)
A = response.json()
print A.get('users_online')


