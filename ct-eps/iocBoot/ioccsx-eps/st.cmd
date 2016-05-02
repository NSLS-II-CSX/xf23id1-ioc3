#!../../bin/linux-x86_64/csx-eps

## You may have to change csx-eps to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

epicsEnvSet("ENGINEER", "Ruslan Kadyrov x2421")
epicsEnvSet("LOCATION", "23ID")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST", "10.23.0.255")

## Register all support components
dbLoadDatabase "dbd/csx-eps.dbd"
csx_eps_registerRecordDeviceDriver pdbbase

EIP_buffer_limit(492)
drvEtherIP_init()
drvEtherIP_define_PLC("XF_23ID_EPS_ES1_PLC_F1","10.23.2.43",0)
EIP_verbosity(6)

## Load record instances

dbLoadRecords("db/ct-eps-plc-va.db")
dbLoadRecords("db/ct-eps-plc-tc.db")
dbLoadRecords("db/ct-eps-plc-misc.db")

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

asSetFilename("${TOP}/iocasg")

dbLoadRecords("$(EPICS_BASE)/db/iocAdminSoft.db", "IOC=XF:23ID1-CT{IOC:EPS}")
dbLoadRecords("$(EPICS_BASE)/db/save_restoreStatus.db", "P=XF:23ID1-CT{IOC:EPS}")

asSetSubstitutions("WS=csxws1")
asSetFilename("/epics/xf/23id/xf23id.acf")

iocInit

caPutLogInit("xf23id-ca:7004", 0)

# Write PVlist for channelfinder

dbl("*") > "${TOP}/records.dbl"
system("cp ${TOP}/records.dbl /cf-update/xf23id1-ioc3.ct-eps.dbl")

