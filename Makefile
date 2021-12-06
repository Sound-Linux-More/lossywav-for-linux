PROJECT = lossywav
COMMON_CXXFLAGS = -std=c++11 -O2 -pipe
DEFINES = -DHAVE_STD_CHRONO_STEADY_CLOCK_NOW -DHAVE_SETPRIORITY -DHAVE_STAT -DHAVE_CHMOD -DHAVE_NANOSLEEP
AR = ar
LDFLAGS = -s

CXXFLAGS = ${COMMON_CXXFLAGS} ${DEFINES}
ifeq ($(shell uname --machine), x86_64)
    CXXFLAGS += -fPIC
endif
ifeq ($(shell uname --machine), aarch64)
    CXXFLAGS += -fPIC
endif

HEADERS = version.h \
          units/fftw_interface.h \
          units/nComplex.h \
          units/nCore.h \
          units/nFFT.h \
          units/nFillFFT.h \
          units/nInitialise.h \
          units/nMaths.h \
          units/nOutput.h \
          units/nParameter.h \
          units/nProcess.h \
          units/nRemoveBits.h \
          units/nSGNS.h \
          units/nShiftBlocks.h \
          units/nSpreading.h \
          units/nSupport.h \
          units/nWav.h

OBJS = units/fftw_interface.o \
       units/nCore.o \
       units/nFFT.o \
       units/nFillFFT.o \
       units/nInitialise.o \
       units/nOutput.o \
       units/nParameter.o \
       units/nProcess.o \
       units/nRemoveBits.o \
       units/nSGNS.o \
       units/nShiftBlocks.o \
       units/nSpreading.o \
       units/nWav.o

OBJB = lossyWAV.o

all: $(OBJS) $(OBJB) link

*.o: ${@:.o=.cpp} $(HEADERS)
	${CXX:-g++} -c ${@:.o=.cpp} -o ${@} ${CXXFLAGS}

link: $(OBJS) $(OBJB)
	${AR} crs lib${PROJECT}.a ${OBJS}
	${CXX} -shared ${OBJS} -Wl,-soname,lib${PROJECT}.so.1 -o lib${PROJECT}.so.1 ${LDFLAGS}
	${CXX} ${OBJB} lib${PROJECT}.so.1 -o ${PROJECT} ${LDFLAGS}
	${CXX} ${OBJB} lib${PROJECT}.a -o ${PROJECT}-static ${LDFLAGS}

clean:
	-rm -f $(OBJS) $(OBJB) lib${PROJECT}.a lib${PROJECT}.so.1 ${PROJECT} ${PROJECT}-static
