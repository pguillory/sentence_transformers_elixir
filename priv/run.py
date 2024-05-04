import json
import sys
import time
from sentence_transformers import SentenceTransformer


opts_json = sys.stdin.readline()
opts = json.loads(opts_json)
model_name = opts.get('model_name', 'all-MiniLM-L6-v2')
model = SentenceTransformer(model_name)
model.encode('')
print('{"status":"ready"}', flush=True)

for request_json in sys.stdin:
    try:
        request = json.loads(request_json)
        embedding = model.encode(request['text'])

        response = {
            "embedding": [float(x) for x in embedding]
        }
    except e:
        response = {
            error: str(e)
        }

    print(json.dumps(response), flush=True)
