# - Try to find OpenAL-Soft
# and define
#
#  OPENALSOFT_FOUND          - System has OpenAL-Soft
#  OPENALSOFT_INCLUDE_DIR    - The OpenAL-Soft include directories
#  OPENALSOFT_LIBRARY        - The OpenAL-Soft libraries

find_path(OPENALSOFT_INCLUDE_DIR 
  NAMES al.h
  PATHS
    ~/Library/Frameworks
    /Library/Frameworks
    /sw # Fink
    /opt/local # DarwinPorts
    /opt/csw # Blastwave
    /opt
    # Travis CI - MAC OSX
    /usr/local/opt/openal-soft/
)

find_library(OPENALSOFT_LIBRARY 
  NAMES libopenal openal libOpenAL32 OpenAL32 OpenAL32.dll soft_oal.dll
  PATHS 
    ${OPENALSOFT_INCLUDE_DIR}/../lib 
    lib
)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(OPENALSOFT DEFAULT_MSG OPENALSOFT_LIBRARY OPENALSOFT_INCLUDE_DIR)

mark_as_advanced(OPENALSOFT_INCLUDE_DIR OPENALSOFT_LIBRARY)