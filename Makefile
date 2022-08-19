PROJECT = lossywav
TARGET = $(PROJECT)
TLIBA = lib${PROJECT}.a
TLIBSO = lib${PROJECT}.so.1
COMMON_CXXFLAGS = -std=c++11 -O2 -pipe
DEFINES = -DHAVE_STD_CHRONO_STEADY_CLOCK_NOW -DHAVE_SETPRIORITY -DHAVE_STAT -DHAVE_CHMOD -DHAVE_NANOSLEEP
AR = ar
LDFLAGS = -s

CXXFLAGS = ${COMMON_CXXFLAGS} ${DEFINES}
ifneq ($(shell uname -m), i386)
    CXXFLAGS += -fPIC
endif

HEADERS = src/units/fftw_interface.h \
          src/units/nComplex.h \
          src/units/nCore.h \
          src/units/nFFT.h \
          src/units/nFillFFT.h \
          src/units/nInitialise.h \
          src/units/nMaths.h \
          src/units/nOutput.h \
          src/units/nParameter.h \
          src/units/nProcess.h \
          src/units/nRemoveBits.h \
          src/units/nSGNS.h \
          src/units/nShiftBlocks.h \
          src/units/nSpreading.h \
          src/units/nSupport.h \
          src/units/nWav.h \
          src/version.h

OBJS = src/units/fftw_interface.o \
       src/units/nCore.o \
       src/units/nFFT.o \
       src/units/nFillFFT.o \
       src/units/nInitialise.o \
       src/units/nOutput.o \
       src/units/nParameter.o \
       src/units/nProcess.o \
       src/units/nRemoveBits.o \
       src/units/nSGNS.o \
       src/units/nShiftBlocks.o \
       src/units/nSpreading.o \
       src/units/nWav.o

OBJB = src/lossyWAV.o

all: $(OBJS) $(OBJB) $(TLIBA) $(TLIBSO) $(TARGET) $(TARGET)-static

*.o: ${@:.o=.cpp} $(HEADERS)
	${CXX:-g++} ${CXXFLAGS} -c ${@:.o=.cpp} -o ${@}

$(TLIBA): $(OBJS)
	${AR} crs $@ $^

$(TLIBSO): $(OBJS)
	${CXX} -shared -Wl,-soname,$@ $^ -o $@ ${LDFLAGS}

$(TARGET): $(OBJB) $(TLIBSO)
	${CXX} $^ -o $@ ${LDFLAGS}

$(TARGET)-static: $(OBJB) $(TLIBA)
	${CXX} $^ -o $@ ${LDFLAGS}

clean:
	-rm -f $(OBJS) $(OBJB) $(TLIBA) $(TLIBSO) $(TARGET) $(TARGET)-static
