
set(CastXML_PATCH_DIR ${fletch_SOURCE_DIR}/Patches/CastXML/)
set(CastXML_PATCH_COMMAND ${CMAKE_COMMAND}
  -DCastXML_patch=${CastXML_PATCH_DIR}
  -DCastXML_source=${fletch_BUILD_PREFIX}/src/CastXML
  -P ${CastXML_PATCH_DIR}/Patch.cmake)

ExternalProject_Add(CastXML
  URL ${CastXML_url}
  URL_MD5 ${CastXML_md5}
  ${COMMON_EP_ARGS}
  ${COMMON_CMAKE_EP_ARGS}
  PATCH_COMMAND ${CastXML_PATCH_COMMAND}
  INSTALL_COMMAND
    ${CMAKE_COMMAND} -E copy_directory ${CMAKE_BINARY_DIR}/build/src/CastXML-build/castxml/bin ${CMAKE_BINARY_DIR}/install/bin
  COMMAND
    ${CMAKE_COMMAND} -E copy_directory ${CMAKE_BINARY_DIR}/build/src/CastXML-build/castxml/share ${CMAKE_BINARY_DIR}/install/share
)

fletch_external_project_force_install(PACKAGE CastXML)

file(APPEND ${fletch_CONFIG_INPUT} "
########################################
# CastXML
########################################
set(fletch_ENABLED_CastXML TRUE)
")
