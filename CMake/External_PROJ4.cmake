
ExternalProject_Add(PROJ4
  URL ${PROJ4_file}
  URL_MD5 ${PROJ4_md5}
  PREFIX ${fletch_BUILD_PREFIX}
  DOWNLOAD_DIR ${fletch_DOWNLOAD_DIR}
  INSTALL_DIR ${fletch_BUILD_INSTALL_PREFIX}
  PATCH_COMMAND ${CMAKE_COMMAND}
  -DPROJ4_patch:PATH=${fletch_SOURCE_DIR}/Patches/PROJ4
  -DPROJ4_source:PATH=${fletch_BUILD_PREFIX}/src/PROJ4
  -P ${fletch_SOURCE_DIR}/Patches/PROJ4/Patch.cmake
  CMAKE_GENERATOR ${gen}
  CMAKE_ARGS
  -DCMAKE_INSTALL_PREFIX:PATH=${fletch_BUILD_INSTALL_PREFIX}
  -DBUILD_SHARED_LIBS:BOOL=ON
  -BUILD_TESTING:BOOL=OFF
  -DPROJ4_ENABLE_TESTS:BOOL=OFF
  -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
  -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
  -DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}
  )

set(PROJ4_ROOT ${fletch_BUILD_INSTALL_PREFIX} CACHE PATH "" FORCE)

file(APPEND ${fletch_CONFIG_INPUT} "
########################################
# PROJ4
########################################
set(PROJ4_ROOT @PROJ4_ROOT@)
")
