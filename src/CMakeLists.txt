# cmake file

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR})


# basic LaTeX class download

include(uoe-infthesis-latex-cls)

# setup logos

add_uoe_eushield(TARGET my-eushield)

# setup latex class file

add_uoe_infthesis(TARGET my-infthesis)

# installation

install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/my-eushield/ DESTINATION .)
install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/my-infthesis/ DESTINATION .)


# extra logos download

include(uoe-logos-extra)

add_uoe_inf_logos(TARGET my-inf-logos)
add_uoe_cdtppar_logos(TARGET my-ppar-logos)
add_uoe_epsrc_logos(TARGET my-epsrc-logos)

# installation

install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/my-inf-logos/ DESTINATION .)
install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/my-ppar-logos/ DESTINATION .)
install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/my-epsrc-logos/ DESTINATION .)

