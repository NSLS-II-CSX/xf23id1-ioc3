#!/epics/xf/23id/apps/areaDetector/ADProsilica/iocs/prosilicaIOC/bin/linux-x86_64/prosilicaApp

< /epics/xf/23id/apps/areaDetector/ADProsilica/iocs/prosilicaIOC/iocBoot/iocProsilica/envPaths

errlogInit(20000)

dbLoadDatabase("$(TOP)/dbd/prosilicaApp.dbd")

prosilicaApp_registerRecordDeviceDriver(pdbbase) 

epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES","40000000")
epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST", "10.23.0.255")
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(ADCORE)/db")

epicsEnvSet("PREFIX", "XF:23ID1-ES{Dif-Cam:1}")
epicsEnvSet("PORT",   "PS1")
epicsEnvSet("QSIZE",  "20")
epicsEnvSet("XSIZE",  "2750")
epicsEnvSet("YSIZE",  "2200")
epicsEnvSet("NCHANS", "2048")

# prosilicaConfig(portName,    # The name of the asyn port to be created
#                 cameraId,    # Unique ID, IP address, or IP name of the camera
#                 maxBuffers,  # Maximum number of NDArray buffers driver can allocate. 0=unlimited
#                 maxMemory,   # Maximum memory bytes driver can allocate. 0=unlimited
#                 priority,    # EPICS thread priority for asyn port driver 0=default
#                 stackSize,   # EPICS thread stack size for asyn port driver 0=default
#                 maxPvAPIFrames) # Number of frames to allocate in PvAPI driver. Default=2.
# The simplest way to determine the uniqueId of a camera is to run the Prosilica GigEViewer application, 
# select the camera, and press the "i" icon on the bottom of the main window to show the camera information for this camera. 
# The Unique ID will be displayed on the first line in the information window.
prosilicaConfig("$(PORT)", "10.23.1.36", 50, 0, 0, 0, 10)

#prosilicaConfig("$(PORT)", 50022, 50, 0)
#prosilicaConfig("$(PORT)", 164.54.160.203, 50, 0)
#prosilicaConfig("$(PORT)", 51039, 50, 0)

asynSetTraceIOMask("$(PORT)",0,2)
#asynSetTraceMask("$(PORT)",0,255)

dbLoadRecords("$(ADCORE)/db/ADBase.template",   "P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")
# Note that prosilica.template must be loaded after NDFile.template to replace the file format correctly
dbLoadRecords("$(ADPROSILICA)/db/prosilica.template","P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")

# Create a standard arrays plugin, set it to get data from first Prosilica driver.
NDStdArraysConfigure("Image1", $(QSIZE), 0, "$(PORT)", 0, 0)
#dbLoadRecords("$(ADCORE)/db/NDPluginBase.template","P=$(PREFIX),R=image1:,PORT=Image1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=$(PORT),NDARRAY_ADDR=0")

# Use this line if you only want to use the Prosilica in 8-bit mode.  It uses an 8-bit waveform record
# NELEMENTS is set large enough for a 1360x1024x3 image size, which is the number of pixels in RGB images from the GC1380CH color camera. 
# Must be at least as big as the maximum size of your camera images
dbLoadRecords("$(ADCORE)/db/NDStdArrays.template", "P=$(PREFIX),R=image1:,PORT=Image1,ADDR=0,TIMEOUT=1,TYPE=Int8,FTVL=UCHAR,NELEMENTS=18163200,NDARRAY_PORT=$(PORT)")

# Use this line if you want to use the Prosilica in 8,12 or 16-bit modes.  
# It uses an 16-bit waveform record, so it uses twice the memory and bandwidth required for only 8-bit data.
#dbLoadRecords("$(ADCORE)/db/NDStdArrays.template", "P=$(PREFIX),R=image1:,PORT=Image1,ADDR=0,TIMEOUT=1,TYPE=Int16,FTVL=SHORT,NELEMENTS=18163200")

# Load all other plugins using commonPlugins.cmd
< $(ADCORE)/iocBoot/commonPlugins.cmd
set_requestfile_path("$(ADPROSILICA)/prosilicaApp/Db")

#asynSetTraceMask("$(PORT)",0,255)

asSetSubstitutions("WS=csxws1")
asSetFilename("/epics/xf/23id/xf23id.acf")

iocInit()

caPutLogInit("xf23id-ca:7004", 0)

# save things every thirty seconds
create_monitor_set("auto_settings.req", 30,"P=$(PREFIX)")

dbl > /cf-update/xf23id1-ioc3.cam-dif1.dbl
