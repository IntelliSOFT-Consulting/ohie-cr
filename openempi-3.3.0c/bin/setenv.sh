export OPENEMPI_HOME=@OPENEMPIHOME@
VMPARAMS=-Xms1024m -Xmx4096m
export JAVA_OPTS="${VMPARAMS} -Dopenempi.home=${OPENEMPI_HOME}"