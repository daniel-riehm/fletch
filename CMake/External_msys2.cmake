if(WIN32)

  ExternalProject_Add(msys2
  URL ${msys2_url}
  URL_MD5 ${msys2_md5}
  ${COMMON_EP_ARGS}
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
  )
  fletch_external_project_force_install(PACKAGE FFmpeg_shared)

endif()

set(msys2_ROOT ${fletch_BUILD_INSTALL_PREFIX} CACHE PATH "" FORCE)

file(APPEND ${fletch_CONFIG_INPUT} "
#######################################
# msys2
#######################################
set(msys2_ROOT \${fletch_ROOT})
set(fletch_ENABLED_msys2 TRUE)
")
