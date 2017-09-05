# cmake file

set(UOE_DIR "uoe")
set(INF_DIR "${UOE_DIR}/informatics")


# setup logos

set(EUSHIELD_DIR "${CMAKE_CURRENT_BINARY_DIR}/${INF_DIR}/eushield")
file(MAKE_DIRECTORY ${EUSHIELD_DIR})

set(EUSHIELD_URL
  http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos)

set(EUSHIELD_LOGOS)
list(APPEND EUSHIELD_LOGOS eushield.sty)
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

set(DOWNLOAD_SCRIPT "${CMAKE_CURRENT_BINARY_DIR}/download.cmake")
set(EUSHIELD_DEST_LOGOS)
foreach(logo ${EUSHIELD_LOGOS})
  file(APPEND ${DOWNLOAD_SCRIPT} 
    "file(DOWNLOAD ${EUSHIELD_URL}/${logo} ${EUSHIELD_DIR}/${logo})\n")
  list(APPEND EUSHIELD_DEST_LOGOS ${EUSHIELD_DIR}/${logo})
endforeach()

add_custom_command(
  OUTPUT ${EUSHIELD_DEST_LOGOS}
  COMMAND ${CMAKE_COMMAND} -P ${DOWNLOAD_SCRIPT})

add_custom_target(uoe-eushield ALL
  DEPENDS ${EUSHIELD_DEST_LOGOS})


# setup latex class file

set(INFTHESIS_FILE "infthesis.cls")
set(INFTHESIS_PATH "${CMAKE_CURRENT_SOURCE_DIR}/${INFTHESIS_FILE}")

set(INFTHESIS_DIR "${INF_DIR}/infthesis")
set(INFTHESIS_DEST_PATH "${INFTHESIS_DIR}/${INFTHESIS_FILE}")
file(MAKE_DIRECTORY ${INFTHESIS_DIR})

file(TO_NATIVE_PATH ${INFTHESIS_PATH} INFTHESIS_NPATH)
file(TO_NATIVE_PATH ${INFTHESIS_DEST_PATH} INFTHESIS_DEST_NPATH)

add_custom_command(
  OUTPUT ${INFTHESIS_DEST_PATH}
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  ${INFTHESIS_NPATH} ${INFTHESIS_DEST_NPATH})

add_custom_target(uoe-infthesis ALL
  DEPENDS ${INFTHESIS_DEST_PATH})


# installation

install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${UOE_DIR} DESTINATION .)

