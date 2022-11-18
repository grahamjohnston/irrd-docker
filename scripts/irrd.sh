#!/bin/sh
rm /var/run/irrd.pid
irrd_database_upgrade
irrd --foreground