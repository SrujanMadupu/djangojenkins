command = '/usr/local/bin/gunicorn'
pythonpath = 'home/mobigesture/Desktop/Projects/jenkins/webpr-staging/jenkinsdjango/jenkinsdjango/'
bind = '0.0.0.0:8000'
workers = 3
user = 'ec2-user'
debug = True
loglevel = 'debug'
pidfile='gunicorn.pid'