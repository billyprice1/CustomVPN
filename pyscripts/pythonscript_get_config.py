#!/usr/bin/env python
execfile("pyscripts/pythonscript_API_auth.py")

response = auth_request('GET',
  '/key/~~~~~/@@@@@.tar',
)
assert(response.status_code == 200)
