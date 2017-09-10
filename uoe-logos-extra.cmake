# cmake file

include(CMakeParseArguments)

#.rst:
# This module defines commands that download and install common logos (in vector
# format) usually required by students of the School of Informatics, University
# of Edinburgh, for typesetting various documents.
#
# Usage:
#
#     include(uoe-logos-extra)
#
#     add_uoe_inf_logos(TARGET my-inf-logos)
#     add_uoe_cdtppar_logos(TARGET my-ppar-logos)
#     add_uoe_esprc_logos(TARGET my-epsrc-logos)
#
# Each command creates a directory with the targets name, under which all the
# relevant files per target are placed. This directory can by used to install
# these files to the desired location using an install() command.
#

# internal function
function(_add_uoe_files)
  set(options)
  set(oneValueArgs SELF TARGET URL)
  set(multiValueArgs REMOTE_FILES LOCAL_FILES)

  cmake_parse_arguments(ADD_UOE_FILES
    "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  if(NOT ADD_UOE_FILES_SELF)
    message(FATAL_ERROR "requires SELF option")
  endif()
  set(SELF ${ADD_UOE_FILES_SELF})

  if(NOT ADD_UOE_FILES_TARGET)
    message(FATAL_ERROR "${SELF}() requires a TARGET option")
  endif()

  if(NOT ADD_UOE_FILES_URL)
    message(FATAL_ERROR "${SELF}() requires a URL option")
  endif()

  if(NOT ADD_UOE_FILES_REMOTE_FILES)
    message(FATAL_ERROR "${SELF}() requires a REMOTE_FILES option")
  endif()

  list(LENGTH ADD_UOE_FILES_REMOTE_FILES remote_files_len)
  list(LENGTH ADD_UOE_FILES_LOCAL_FILES local_files_len)

  if(${local_files_len} GREATER ${remote_files_len})
    message(FATAL_ERROR "${SELF}() has extraneous LOCAL_FILES declared")
  endif()

  if(ADD_UOE_FILES_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "${SELF}() has extraneous arguments declared")
  endif()

  # setup files
  set(DEST_DIR "${CMAKE_CURRENT_BINARY_DIR}/${ADD_UOE_FILES_TARGET}")
  file(MAKE_DIRECTORY ${DEST_DIR})
  set(DOWNLOAD_SCRIPT
    "${CMAKE_CURRENT_BINARY_DIR}/${ADD_UOE_FILES_TARGET}-download.cmake")
  file(REMOVE ${DOWNLOAD_SCRIPT})

  set(DEST_FILES)
  math(EXPR len "${remote_files_len}-1")
  foreach(idx RANGE ${len})
    list(GET ADD_UOE_FILES_REMOTE_FILES ${idx} remote_file)
    list(GET ADD_UOE_FILES_LOCAL_FILES ${idx} local_file)

    if(NOT local_file)
      set(local_file ${remote_file})
    endif()

    file(APPEND ${DOWNLOAD_SCRIPT}
      "file(DOWNLOAD ${ADD_UOE_FILES_URL}/${remote_file} ${DEST_DIR}/${local_file})\n")
    list(APPEND DEST_FILES ${DEST_DIR}/${local_file})
  endforeach()

  add_custom_command(OUTPUT ${DEST_FILES}
    COMMAND ${CMAKE_COMMAND} -P ${DOWNLOAD_SCRIPT})

  add_custom_target(${ADD_UOE_FILES_TARGET} ALL DEPENDS ${DEST_FILES})
endfunction()

function(add_uoe_inf_logos)
  _add_uoe_files(SELF "add_uoe_inf_logos"
    URL http://media.inf.ed.ac.uk/infweb/logos
    REMOTE_FILES InformaticsUni_spot.eps InformaticsUni_CMYK.eps
    ${ARGN})
endfunction()

function(add_uoe_cdtppar_logos)
  _add_uoe_files(SELF "add_uoe_cdtppar_logos"
    URL "http://media.inf.ed.ac.uk/infweb/ppar-logos"
    REMOTE_FILES cmyk.eps black.eps white.eps
    ${ARGN})
endfunction()

function(add_uoe_epsrc_logos)
  _add_uoe_files(SELF "add_uoe_epsrc_logos"
    URL https://www.epsrc.ac.uk/files/aboutus/logos-and-indentity
    REMOTE_FILES
    white-out-sponsorship-logo
    black-and-white-sponsorship-logo-full-resolution
    colour-sponsorship-logo-full-resolution
    LOCAL_FILES
    sponsor-wofullres.eps
    sponsor-bwfullres.eps
    sponsorfullres.eps
    ${ARGN})
endfunction()

