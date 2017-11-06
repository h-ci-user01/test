#!/bin/sh

USER="h-ci-user01"
PW="6BBmcKCF!"

echo $USER
echo $PW

git add .travis.yml
git commit -m "commit refs #379 $1"
git push -u origin master

expect -c "
set timeout 5
spawn /bin/git push -u origin master
expect \"Username for 'https://github.com':\"
send \"${USER}\n\"
expect \"Username for 'Password for 'https://h-ci-user01@github.com':\"
send \"${PW}\n\"
expect \"$\"
exit 0

