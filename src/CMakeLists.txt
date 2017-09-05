# cmake file

#

set(UOE_DIR "uoe/informatics/")


# setup logos

set(EUSHIELD_DIR "${CMAKE_CURRENT_BINARY_DIR}/${UOE_DIR}/eushield")
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

foreach(logo ${EUSHIELD_LOGOS})
  file(DOWNLOAD ${EUSHIELD_URL}/${logo} ${EUSHIELD_DIR}/${logo})
endforeach()


# setup latex class file

set(INFTHESIS_FILE "infthesis.cls")
set(INFTHESIS_PATH "${CMAKE_CURRENT_SOURCE_DIR}/${INFTHESIS_FILE}")

set(INFTHESIS_DIR "${UOE_DIR}/infthesis")
set(INFTHESIS_DEST_PATH "${INFTHESIS_DIR}/${INFTHESIS_FILE}")
file(MAKE_DIRECTORY ${INFTHESIS_DIR})

file(TO_NATIVE_PATH ${INFTHESIS_PATH} INFTHESIS_NPATH)
file(TO_NATIVE_PATH ${INFTHESIS_DEST_PATH} INFTHESIS_DEST_NPATH)

add_custom_command(OUTPUT ${INFTHESIS_DEST_PATH}
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  ${INFTHESIS_NPATH} ${INFTHESIS_DEST_NPATH})

add_custom_target(uoe-infthesis ALL
  DEPENDS ${INFTHESIS_DEST_PATH})

