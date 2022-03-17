if(WIN32)
  # TODO
else()
  if(BUILD_SHARED_LIBS)
    set(_shared_lib_params
      --enable-shared
      )
  else()
    set(_shared_lib_params
      --enable-static
      --enable-pic
      --extra-cflags=-fPIC
      --extra-cxxflags=-fPIC
      --disable-asm
      )
  endif()

  set(X264_CONFIGURE_COMMAND
    ${fletch_BUILD_PREFIX}/src/x264/configure
    --prefix=${fletch_BUILD_INSTALL_PREFIX}
    --disable-cli
    ${_shared_lib_params}
    )
  
  Fletch_Require_Make()
  ExternalProject_Add(x264
    URL ${x264_file}
    DEPENDS ${x264_DEPENDS}
    URL_MD5 ${x264_md5}
    ${COMMON_EP_ARGS}
    CONFIGURE_COMMAND ${X264_CONFIGURE_COMMAND}
    BUILD_COMMAND ${MAKE_EXECUTABLE}
    INSTALL_COMMAND ${MAKE_EXECUTABLE} install
    )
  
  fletch_external_project_force_install(PACKAGE x264)
endif()

set(x264_ROOT ${fletch_BUILD_INSTALL_PREFIX} CACHE PATH "" FORCE)

file(APPEND ${fletch_CONFIG_INPUT} "
#######################################
# x264
#######################################
set(x264_ROOT \${fletch_ROOT})
set(fletch_ENABLED_x264 TRUE)
")
