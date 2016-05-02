TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += csx-epsSupport

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
csx-epsSupport_SRCS += xxxRecord.c
csx-epsSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
csx-epsSupport_SRCS += dbSubExample.c
csx-epsSupport_SRCS += csx-epsHello.c
csx-epsSupport_SRCS += initTrace.c

csx-epsSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = csx-eps
# csx-eps.dbd will be created and installed
DBD += csx-eps.dbd

# csx-eps.dbd will be made up from these files:
csx-eps_DBD += base.dbd
csx-eps_DBD += xxxSupport.dbd
csx-eps_DBD += dbSubExample.dbd
csx-eps_DBD += csx-epsHello.dbd
csx-eps_DBD += initTrace.dbd
csx-eps_DBD += ether_ip.dbd
csx-eps_DBD += system.dbd
csx-eps_DBD += devIocStats.dbd
csx-eps_DBD += caPutLog.dbd

# csx-eps_registerRecordDeviceDriver.cpp derives from csx-eps.dbd
csx-eps_SRCS += csx-eps_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
csx-eps_SRCS_DEFAULT += csx-epsMain.cpp
csx-eps_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#csx-eps_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
csx-eps_LIBS += csx-epsSupport
csx-eps_LIBS += ether_ip
csx-eps_LIBS += devIocStats
csx-eps_LIBS += caPutLog

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into csx-epsSupport
    sncExample_SNCFLAGS += +r
    csx-eps_DBD += sncExample.dbd
    csx-epsSupport_SRCS += sncExample.stt
    csx-epsSupport_LIBS += seq pv
    csx-eps_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
csx-eps_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

