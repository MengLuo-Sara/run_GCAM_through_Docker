#!/bin/bash
echo "starting script"
ls
cp -r /gcam ./
echo $_CONDOR_SCRATCH_DIR
echo "finish start"
mv $_CONDOR_SCRATCH_DIR/configuration_parallel.tar.gz $_CONDOR_SCRATCH_DIR/gcam/exe
echo "finish step0"
ls
cd $_CONDOR_SCRATCH_DIR/gcam/exe
echo "finish step1"
ls
tar -xzf configuration_parallel.tar.gz
echo "finish step2"
ls
mv -v gcam_files/* $_CONDOR_SCRATCH_DIR/gcam/exe
echo "finish step3"
ls
./gcam.exe -C configuration_ref.xml
echo "finish step4"
ls
cd $_CONDOR_SCRATCH_DIR/
echo "finish step5"
ls
mv -v $_CONDOR_SCRATCH_DIR/gcam/output ./
echo "finish step6"
ls
mv -v $_CONDOR_SCRATCH_DIR/gcam/exe/logs ./output/
echo "finish step7"
ls
tar -czf policy_output.tar.gz ./output
echo "finish all"

