#!/usr/lib/epics/bin/linux-x86_64/vactrl

## You may have to change cn7500 to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase("${EPICS_BASE}/dbd/vactrl.dbd")
vactrl_registerRecordDeviceDriver(pdbbase)

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST", "10.23.0.255")
epicsEnvSet("STREAM_PROTOCOL_PATH", "/usr/share/epics-vactrl-dev/protocol")

drvAsynIPPortConfigure("P0","10.23.2.64:4001")
drvAsynIPPortConfigure("P1","10.23.2.65:4001")
#asynSetTraceMask("P0",-1,"0x9")
#asynSetTraceIOMask("P0",-1,"0x9")
#asynSetTraceMask("P1",-1,"0x9")
#asynSetTraceIOMask("P1",-1,"0x9")
:
## Load record instances

dbLoadRecords("${EPICS_BASE}/db/cn7500_set.db", "P=XF:23ID-VA:BC01,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/asynRecord.db", "P=XF:23ID-VA:BC01,R={}Asyn,PORT=P0,ADDR=0,IMAX=1024,OMAX=1024")

dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:01},P=XF:23ID-VA:BC01,HEXADR=01,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:02},P=XF:23ID-VA:BC01,HEXADR=02,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:03},P=XF:23ID-VA:BC01,HEXADR=03,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:04},P=XF:23ID-VA:BC01,HEXADR=04,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:05},P=XF:23ID-VA:BC01,HEXADR=05,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:06},P=XF:23ID-VA:BC01,HEXADR=06,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:07},P=XF:23ID-VA:BC01,HEXADR=07,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:08},P=XF:23ID-VA:BC01,HEXADR=08,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:09},P=XF:23ID-VA:BC01,HEXADR=09,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:10},P=XF:23ID-VA:BC01,HEXADR=0A,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:11},P=XF:23ID-VA:BC01,HEXADR=0B,PORT=P0")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC01,Dev={TC:12},P=XF:23ID-VA:BC01,HEXADR=0C,PORT=P0")

dbLoadRecords("${EPICS_BASE}/db/cn7500_set.db", "P=XF:23ID-VA:BC02,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/asynRecord.db", "P=XF:23ID-VA:BC02,R={}Asyn,PORT=P1,ADDR=0,IMAX=1024,OMAX=1024")

dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:01},P=XF:23ID-VA:BC01,HEXADR=01,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:02},P=XF:23ID-VA:BC01,HEXADR=02,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:03},P=XF:23ID-VA:BC01,HEXADR=03,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:04},P=XF:23ID-VA:BC01,HEXADR=04,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:05},P=XF:23ID-VA:BC01,HEXADR=05,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:06},P=XF:23ID-VA:BC01,HEXADR=06,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:07},P=XF:23ID-VA:BC01,HEXADR=07,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:08},P=XF:23ID-VA:BC01,HEXADR=08,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:09},P=XF:23ID-VA:BC01,HEXADR=09,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:10},P=XF:23ID-VA:BC01,HEXADR=0A,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:11},P=XF:23ID-VA:BC01,HEXADR=0B,PORT=P1")
dbLoadRecords("${EPICS_BASE}/db/cn7500_controller.db","Sys=XF:23ID-VA:BC02,Dev={TC:12},P=XF:23ID-VA:BC01,HEXADR=0C,PORT=P1")

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq snccn7500, "Sys=XF:23ID1-BC01,Dev={TC:01}"
#seq tempCompare, "Sys=XF:23ID1-BC01,Dev={TC:01}"

dbl > /cf-update/xf23id1-ioc3.va-bakeout-01.dbl

dbpf XF:23ID-VA:BC01{TC:01}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC01{TC:02}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC01{TC:03}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC01{TC:04}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC01{TC:05}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC01{TC:06}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC01{TC:07}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC01{TC:08}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC01{TC:09}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC01{TC:10}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC01{TC:11}Cmd:Use-Cmd "In Use"

dbpf XF:23ID-VA:BC02{TC:01}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC02{TC:05}Cmd:Use-Cmd "In Use"
dbpf XF:23ID-VA:BC02{TC:09}Cmd:Use-Cmd "In Use"

