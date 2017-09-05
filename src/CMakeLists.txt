# cmake file

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR})
include(uoe-infthesis-latex-cls)

# setup logos

add_uoe_eushield(TARGET my-eushield)

# setup latex class file

add_uoe_infthesis(TARGET my-infthesis)

# installation

install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/my-eushield/uoe DESTINATION .)
install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/my-infthesis/uoe DESTINATION .)

