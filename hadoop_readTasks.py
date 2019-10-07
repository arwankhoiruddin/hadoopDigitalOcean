import requests
import json

def getJSON(url):
    r = requests.get(url)
    return json.loads(r.text)

server = 'http://hadoop1:19888'
url = server + '/ws/v1/history/mapreduce/jobs'

parsed_json = getJSON(url)

jobs = parsed_json['jobs']['job']

print 'output format: [jobid taskid nodeHttpAddress startTime finishTime]'

for i in range(len(jobs)):
    jobid = jobs[i]['id']

    taskurl = url + '/' + jobid + '/tasks'

    parsed_json = getJSON(taskurl)
    tasks = parsed_json['tasks']['task']

    for j in range(len(tasks)):
        taskid = tasks[j]['id']
        tasktype = tasks[j]['type']

        tattempturl = taskurl + '/' + taskid + '/attempts'
        parsed_json = getJSON(tattempturl)

        attempts = parsed_json['taskAttempts']['taskAttempt']

        for k in range(len(attempts)):
            atm = attempts[k]
            rack = atm['rack']
            nodeHttpAddress = atm['nodeHttpAddress']
            startTime = atm['startTime']
            finishTime = atm['finishTime']
            print(jobid + ' ' + taskid + ' ' + nodeHttpAddress + ' ' + str(startTime) + ' ' + str(finishTime))
