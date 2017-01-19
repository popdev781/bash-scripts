#!/bin/bash

HOST="server_name"

g_code=`/usr/bin/oathtool -b --totp SECRET_KEY` #google auth tool to generate passcode
#printf "$g_code"

ldap_password=$(echo encoded_password | base64 -d )  #value can be passed directly
#printf "$ldap_password"

/usr/bin/expect ldadar.exp $HOST $g_code $ldap_password
