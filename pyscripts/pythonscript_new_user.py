#!/usr/bin/env python
execfile("pyscripts/pythonscript_API_auth.py")

response = auth_request('POST',
  '/user/@@@@@',
  headers={
      'Content-Type': 'application/json',
  },
  data=json.dumps({
      'name': '~~~~~',
      'disabled': False,
  }),
)
assert(response.status_code == 200)
id = response.json()
print id.get('id')
