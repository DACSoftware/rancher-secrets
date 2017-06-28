# rancher-secrets

Script loads Rancher's secrets to env variables

## Usage

Let's assume you want to load value of a secret named **db_password** to env **$PG_PASS**

1. Make sure your Rancher environment has Secrets stack running
2. Set variable value in Rancher → Infrastructure → Secrets
3. Set special env variable of your container/service:
```bash
PG_PASS_secret=db_password
```
Please note the '_secret' suffix. Value should be set to secret's name.

4. Load script in your entrypoint or command script:
```bash
#!/bin/bash

source ./rancher-secrets.sh

echo Value of \$PG_PASS is \"$PG_PASS\"
```
