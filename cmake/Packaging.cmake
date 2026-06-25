# SPDX-License-Identifier: Apache-2.0

file(STRINGS "${CMAKE_CURRENT_SOURCE_DIR}/src/btop.cpp" BTOP_VERSION_LINE REGEX "Version =")
string(REGEX REPLACE ".*Version = \"([^\"]+)\".*" "\\1" BTOP_PACKAGE_VERSION "${BTOP_VERSION_LINE}")
if(NOT BTOP_PACKAGE_VERSION)
  set(BTOP_PACKAGE_VERSION "0.0.0")
endif()

if(GIT_COMMIT)
  set(BTOP_PACKAGE_VERSION "${BTOP_PACKAGE_VERSION}+${GIT_COMMIT}")
endif()

set(BTOP_DEBIAN_PACKAGE_DEPENDS "libc6, libgcc-s1, libstdc++6"
  CACHE STRING "Debian package dependency list")

set(CPACK_PACKAGE_NAME "btop")
set(CPACK_PACKAGE_VENDOR "btop")
set(CPACK_PACKAGE_CONTACT "Hygon DTK adaptation <root@localhost>")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Resource monitor with Hygon DTK GPU support")
set(CPACK_PACKAGE_DESCRIPTION
  "btop++ is a terminal resource monitor for CPU, memory, disks, network, processes, and GPU metrics.
This package enables Linux GPU monitoring and includes the Hygon DTK ROCm SMI adaptation.")
set(CPACK_PACKAGE_HOMEPAGE_URL "${PROJECT_HOMEPAGE_URL}")
set(CPACK_PACKAGE_VERSION "${BTOP_PACKAGE_VERSION}")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "btop")
set(CPACK_PACKAGE_RELOCATABLE FALSE)
set(CPACK_STRIP_FILES TRUE)

set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${CPACK_PACKAGE_CONTACT}")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION}")
set(CPACK_DEBIAN_PACKAGE_SECTION "utils")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
set(CPACK_DEBIAN_PACKAGE_RELEASE "1")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "${BTOP_DEBIAN_PACKAGE_DEPENDS}")
set(CPACK_DEBIAN_FILE_NAME "DEB-DEFAULT")

set(CPACK_RPM_PACKAGE_LICENSE "Apache-2.0")
set(CPACK_RPM_PACKAGE_GROUP "Applications/System")
set(CPACK_RPM_PACKAGE_DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION}")
set(CPACK_RPM_PACKAGE_RELEASE "1")
set(CPACK_RPM_PACKAGE_AUTOREQ "yes")
set(CPACK_RPM_FILE_NAME "RPM-DEFAULT")
set(CPACK_RPM_EXCLUDE_FROM_AUTO_FILELIST_ADDITION
  "/usr/share/applications"
  "/usr/share/icons"
  "/usr/share/icons/hicolor"
  "/usr/share/icons/hicolor/48x48"
  "/usr/share/icons/hicolor/48x48/apps"
  "/usr/share/icons/hicolor/scalable"
  "/usr/share/icons/hicolor/scalable/apps"
)

include(CPack)
