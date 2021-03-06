
#!/bin/bash

sleep 15

#Set variables to the value defined by you
: ${RECEIVING_APPLICATION=MESA_XREF}
: ${RECEIVING_FACILITY=XYZ_HOSPITAL}

export Receiving_Application
export Receiving_Facility

/utils/replace-vars /sysnet/openempi-3.3.0c/openempi-entity-3.3.0c/conf/PixManagerConnections.xml    

#start nagios nrpe
/etc/init.d/nagios-nrpe-server start

#start openEMPI

export PGPASSWORD=openempi

psql -h openempi-db -p 5432 -d openempi -U openempi -f /sysnet/openempi-3.3.0c/openempi-entity-3.3.0c/conf/create_new_database_schema-3.0.0.sql
psql -h openempi-db -p 5432 -d openempi -U openempi -f /sysnet/openempi-3.3.0c/openempi-entity-3.3.0c/conf/update_database_schema-3.3.0.sql
psql -h openempi-db -p 5432 -d openempi -U openempi -f /sysnet/openempi-3.3.0c/openempi-entity-3.3.0c/conf/create_person_entity_model_definition.sql
psql -h openempi-db -p 5432 -d openempi -U openempi -f /sysnet/openempi-3.3.0c/openempi-entity-3.3.0c/conf/create_person_reference_tables.sql
psql -h openempi-db -p 5432 -d openempi -U openempi -f /sysnet/openempi-3.3.0c/openempi-entity-3.3.0c/conf/update_database_schema-3.3.0.sql

./sysnet/openempi-3.3.0c/bin/catalina.sh jpda run
