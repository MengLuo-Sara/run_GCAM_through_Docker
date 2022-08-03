#!/bin/bash

mv $_CONDOR_SCRATCH_DIR/configuration_parallel.tar.gz /gcam/exe
cd /gcam/exe
tar -xzf configuration_parallel.tar.gz
mv -v gcam_files/* /gcam/exe

./gcam.exe -C configuration_policy.xml
CLASSPATH=/jars*:/gcam/output/modelinterface/ModelInterface.jar
java -cp $CLASSPATH ModelInterface/InterfaceMain -b xmldb_batch.xml

cd /gcam
mkdir policy_output
mv -v /gcam/exe/logs/main_log.txt /gcam/policy_output
mv -v /gcam/output/database_basexdb /gcam/policy_output
mv -v /gcam/output/output.csv /gcam/policy_output

cd /gcam
tar -czf policy_output.tar.gz policy_output/
mv policy_output.tar.gz $_CONDOR_SCRATCH_DIR