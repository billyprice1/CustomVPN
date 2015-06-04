#!/usr/bin/env python
execfile("pyscripts/pythonscript_API_auth.py")

response = auth_request('GET',
  '/user/a38f102c0eb54611aacd726aa3dbc306',
)
assert(response.status_code == 200)
#print response.json()
decoded = json.loads(response.text)
print json.dumps(decoded, sort_keys=True, indent=4) 
#print decoded[5].values()
#print json.dumps(a, sort_keys=True, indent=4) 
