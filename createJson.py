import json
import os

s3path = os.getenv('S3', '')
awsdb = os.getenv('ADB', '')
localdb = os.getenv('LDB', '')

iplant_user = os.getenv('IPLANT_USER', '')

localpath = f"/data-store/iplant/home/{iplant_user}/{localdb}"

obj = {
        's3_path' : s3path,
        'database' : awsdb,
        'localdb' : localpath
    }

jstr = json.dumps(obj, indent=2)
print(jstr)
