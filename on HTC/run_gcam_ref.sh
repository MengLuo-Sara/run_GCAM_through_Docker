#!/bin/bash

mv $_CONDOR_SCRATCH_DIR/configuration_parallel.tar.gz /gcam/exe
cd /gcam/exe
tar -xzf configuration_parallel.tar.gz
mv -v gcam_files/* /gcam/exe

./gcam.exe -C configuration_ref.xml
CLASSPATH=/jars*:/gcam/output/modelinterface/ModelInterface.jar
java -cp $CLASSPATH ModelInterface/InterfaceMain -b xmldb_batch.xml

cd /gcam
mkdir reference_output
mv -v /gcam/exe/logs/main_log.txt /gcam/reference_output
mv -v /gcam/output/database_basexdb /gcam/reference_output
mv -v /gcam/output/output.csv /gcam/reference_output

cd /gcam
tar -czf reference_output.tar.gz reference_output/
mv reference_output.tar.gz $_CONDOR_SCRATCH_DIR