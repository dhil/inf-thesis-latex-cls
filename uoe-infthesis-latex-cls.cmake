# cmake file

include(CMakeParseArguments)

set(_UOE_INFTHESIS_CURRENT_DIR "${CMAKE_CURRENT_LIST_DIR}/src")

#.rst:
# This module defines commands that allow the installation of the LaTeX class
# for a University of Edinburgh, School of Informatics thesis class (infthesis)
# along with the relevant crest logos.
#
# Usage:
#
#     include(uoe-infthesis-latex-cls)
#
#     add_uoe_thesis(TARGET my-thesis-class)
#     add_uoe_eushield(TARGET my-eushield)
#
# Each command creates a directory with the targets name, under which a
# directory named "uoe" is placed with all the relevant files per target. These
# directories can by used to install these files to the desired location using
# an install() command.
#

function(add_uoe_eushield)
  set(options)
  set(oneValueArgs TARGET)
  set(multiValueArgs)

  cmake_parse_arguments(ADD_UOE_EUSHIELD
    "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

  if ("${ADD_UOE_EUSHIELD_TARGET}" STREQUAL "")
    message(FATAL_ERROR
      "add_uoe_eushield() requires a target name by using the TARGET option")
  endif()

  set(UOE_DIR "${ADD_UOE_EUSHIELD_TARGET}/tex/latex/uoe")
  set(INF_DIR "${UOE_DIR}/informatics")

  # setup logos

  set(EUSHIELD_DIR "${CMAKE_CURRENT_BINARY_DIR}/${INF_DIR}/eushield")
  file(MAKE_DIRECTORY ${EUSHIELD_DIR})

  set(EUSHIELD_URL
    http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos)

  set(EUSHIELD_LOGOS)
  list(APPEND EUSHIELD_LOGOS eushield.sty)
  list(APPEND EUSHIELD_LOGOS eushield.eps)
  list(APPEND EUSHIELD_LOGOS eushield-normal.pdf)
  list(APPEND EUSHIELD_LOGOS eushield-normal.ps)
  list(APPEND EUSHIELD_LOGOS eushield-noback.pdf)
  list(APPEND EUSHIELD_LOGOS eushield-noback.ps)
  list(APPEND EUSHIELD_LOGOS eushield-reversed.pdf)
  list(APPEND EUSHIELD_LOGOS eushield-reversed.ps)
  list(APPEND EUSHIELD_LOGOS eushield-twocolour.pdf)
  list(APPEND EUSHIELD_LOGOS eushield-twocolour.ps)
  list(APPEND EUSHIELD_LOGOS eushield-fullcolour.pdf)
  list(APPEND EUSHIELD_LOGOS eushield-fullcolour.ps)

  set(DOWNLOAD_SCRIPT
    "${CMAKE_CURRENT_BINARY_DIR}/${ADD_UOE_EUSHIELD_TARGET}-download.cmake")
  file(REMOVE ${DOWNLOAD_SCRIPT})

  set(EUSHIELD_DEST_LOGOS)
  foreach(logo ${EUSHIELD_LOGOS})
    file(APPEND ${DOWNLOAD_SCRIPT}
      "file(DOWNLOAD ${EUSHIELD_URL}/${logo} ${EUSHIELD_DIR}/${logo})\n")
    list(APPEND EUSHIELD_DEST_LOGOS ${EUSHIELD_DIR}/${logo})
  endforeach()

  add_custom_command(
    OUTPUT ${EUSHIELD_DEST_LOGOS}
    COMMAND ${CMAKE_COMMAND} -P ${DOWNLOAD_SCRIPT})

  add_custom_target(${ADD_UOE_EUSHIELD_TARGET} ALL
    DEPENDS ${EUSHIELD_DEST_LOGOS})
endfunction()


function(add_uoe_infthesis)
  set(options)
  set(oneValueArgs TARGET)
  set(multiValueArgs)

  cmake_parse_arguments(ADD_UOE_INFTHESIS
    "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

  if ("${ADD_UOE_INFTHESIS_TARGET}" STREQUAL "")
    message(FATAL_ERROR
      "add_uoe_infthesis() requires a target name by using the TARGET option")
  endif()

  set(UOE_DIR "${ADD_UOE_INFTHESIS_TARGET}/tex/latex/uoe")
  set(INF_DIR "${UOE_DIR}/informatics")

  set(INFTHESIS_FILE "infthesis.cls")
  set(INFTHESIS_PATH "${_UOE_INFTHESIS_CURRENT_DIR}/${INFTHESIS_FILE}")

  set(INFTHESIS_DIR "${INF_DIR}/infthesis")
  set(INFTHESIS_DEST_PATH "${INFTHESIS_DIR}/${INFTHESIS_FILE}")

  file(TO_NATIVE_PATH ${INFTHESIS_PATH} INFTHESIS_NPATH)
  file(TO_NATIVE_PATH ${INFTHESIS_DEST_PATH} INFTHESIS_DEST_NPATH)

  add_custom_command(
    OUTPUT ${INFTHESIS_DEST_PATH}
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    ${INFTHESIS_NPATH} ${INFTHESIS_DEST_NPATH})

  add_custom_target(${ADD_UOE_INFTHESIS_TARGET} ALL
    DEPENDS ${INFTHESIS_DEST_PATH})
endfunction()

