# Attempts to find libusb (not libusb-1.0)
#
#  LIBUSB_FOUND - system has libusb
#  LIBUSB_INCLUDE_DIRS - the libusb include directory
#  LIBUSB_LIBRARIES - Link these to use libusb
#  LIBUSB_DEFINITIONS - Compiler switches required for using libusb
#
#  Adapted from cmake-modules Google Code project
#
#  Copyright (c) 2006 Andreas Schneider <mail@cynapses.org>
#
#  (Changes for libusb) Copyright (c) 2014 Jacob Alexander <haata@kiibohd.com>
#
# Redistribution and use is allowed according to the terms of the New BSD license.
#
# CMake-Modules Project New BSD License
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
# * Neither the name of the CMake-Modules Project nor the names of its
#   contributors may be used to endorse or promote products derived from this
#   software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#


if ( LIBUSB_LIBRARIES AND LIBUSB_INCLUDE_DIRS )
	# in cache already
	set( LIBUSB_FOUND TRUE )
else ()
	find_path( LIBUSB_INCLUDE_DIR
		NAMES
			usb.h
		PATHS
			/usr/include
			/usr/local/include
			/opt/local/include
			/sw/include
			/include
	)

	find_library( LIBUSB_LIBRARY
		NAMES
			usb
		PATHS
			/usr/lib
			/usr/local/lib
			/opt/local/lib
			/sw/lib
			/lib
	)

	set( LIBUSB_INCLUDE_DIRS ${LIBUSB_INCLUDE_DIR} )
	set( LIBUSB_LIBRARIES ${LIBUSB_LIBRARY} )

	if ( LIBUSB_INCLUDE_DIRS AND LIBUSB_LIBRARIES )
		 set( LIBUSB_FOUND TRUE )
	endif ()

	if ( LIBUSB_FOUND )
		if ( NOT LIBUSB_FIND_QUIETLY )
			message( STATUS "Found libusb:" )
			message( STATUS " - Includes: ${LIBUSB_INCLUDE_DIRS}" )
			message( STATUS " - Libraries: ${LIBUSB_LIBRARIES}" )
		endif ()
	else ()
		if ( LIBUSB_FIND_REQUIRED )
			message( FATAL_ERROR "Could not find libusb" )
		endif ()
	endif ()

	# show the LIBUSB_INCLUDE_DIRS and LIBUSB_LIBRARIES variables only in the advanced view
	mark_as_advanced( LIBUSB_INCLUDE_DIRS LIBUSB_LIBRARIES )

endif ()
