#!/bin/sh
set -e

export INSTANCE_DIR=$1
echo "configure_jolokia_access"
echo $INSTANCE_DIR

#Remove the server side origin check

sed -i 's/<strict-checking\/>//g' $INSTANCE_DIR/etc/jolokia-access.xml
sed -i '27,34d' $INSTANCE_DIR/etc/bootstrap.xml
sed -i '19,48d' $INSTANCE_DIR/etc/management.xml
sed -i 's/^CLASSPATH=\"\$.*\"/CLASSPATH=\"\$ARTEMIS_HOME\/lib\/artemis-boot.jar\:\$ARTEMIS_HOME\/lib\/geronimo-json_1.0_spec-1.0-alpha-1.jar:\$ARTEMIS_HOME\/lib\/johnzon-core-0.9.5.jar\"/' $INSTANCE_DIR/bin/artemis
