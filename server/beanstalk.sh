#!/bin/bash -ex
find / -name beanstalkd
exec beanstalkd -p 11300
