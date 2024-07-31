# Dependencies to install:
# For apt:
# $ sudo apt-get install jq
# For yum:
# $ sudo yum install jq

access_token=$(curl --location --request POST 'https://api.getport.io/v1/auth/access_token' --header 'Content-Type: application/json' --data-raw '{
	"clientId": "xx",
	"clientSecret": "xx"
}' | jq '.accessToken' | sed 's/"//g')

# The token will be available in the access_token variable

blueprint_id='runningService'

curl --location --request POST "https://api.getport.io/v1/blueprints/${blueprint_id}/entities?upsert=true" 	--header "Authorization: Bearer $access_token" 	--header "Content-Type: application/json" 	--data-raw '{
	"identifier": "sgt_wealthbonus",
	"title": "sgt wealthbonus",
	"properties": {"locked":false,"version":"string","commitSha":"xssdewew","cpuLimit":1,"memoryLimit":40,"pullRequest":"https://github.com/tkhalane/sgt-demo/pull/2","namespace":"sgt-demo","grafana":"https://grafana.com","replicaCount":2,"cpu":1,"memory":30},
	"relations": {"service":"sgt_wealthbonus"}
}'

# The output of the command contains the content of the resulting blueprint