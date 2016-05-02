#!../../bin/linux-x86_64/K2611

## You may have to change K2611 to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("STREAM_PROTOCOL_PATH","$(TOP)/proto")

## Register all support components
dbLoadDatabase("../../dbd/K2611.dbd",0,0)
K2611_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("K1","10.23.3.63:5025")
asynSetTraceMask("K1", 0, 0x9)#DEBUGGING
asynSetTraceIOMask("K1", 0, 0x2)#DEBUGGING -  turns on trace 


## Load record instances
dbLoadRecords("../../db/K2611.db","Sys=XF:23ID1-ES,Dev={K2611:1},PORT=K1")
iocInit()

## Start any sequence programs
#seq sncK2611,"user=cmazzoli"
