#!/bin/bash

groupadd -g $APACHE_RUN_USER_ID $APACHE_RUN_USER
useradd -g $APACHE_RUN_USER -u $APACHE_RUN_USER_ID $APACHE_RUN_USER

set -e

apache2-foreground