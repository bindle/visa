#
#   Visa Single Sign-on Web System
#   Copyright (C) 2009 David M. Syzdek <syzdek@bindlebinaries.net>
#
#   @VISA_COPYRIGHT_START@
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License along
#   with this program; if not, write to the Free Software Foundation, Inc.,
#   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#   @VISA_COPYRIGHT_END@
#
#   acinclude.m4 - custom m4 macros used by configure.ac
#

# AC_VISA_GIT_PACKAGE_VERSION()
# -----------------------------------
AC_DEFUN([AC_VISA_GIT_PACKAGE_VERSION],[dnl

   if test -d ${srcdir}/.git -o -f ${srcdir}/.git;then
      GPV=$(git describe --abbrev=4 HEAD 2>/dev/null)
      GPV=$(echo "$GPV" | sed -e 's/-/./g')
      GPV=$(echo "$GPV" | sed -e 's/^v//g')
      if test "x${GPV}" != "x";then
         AC_MSG_NOTICE([using git package version ${GPV}])
         if test -d ${ac_aux_dir};then 
            echo ${GPV} > ${ac_aux_dir}/git-package-version
         fi
      fi
   elif test -f ${ac_aux_dir}/git-package-version;then
      GPV=$(cat ${ac_aux_dir}/git-package-version)
      if test -d ${ac_aux_dir};then
         AC_MSG_NOTICE([using cached git package version ${GPV}])
      fi
   fi

   if test "x${GPV}" = "x";then
      AC_MSG_WARN([unable to determine package version from Git tags])
   else
      #
      # set internal variables
      GIT_PACKAGE_VERSION=${GPV}
      PACKAGE_VERSION=${GPV}
      VERSION=${GPV}
      #
      # set substitution variables
      AC_SUBST([GIT_PACKAGE_VERSION], [${GPV}])
      AC_SUBST([PACKAGE_VERSION], [${GPV}])
      AC_SUBST([VERSION], [${GPV}])
      #
      # set C/C++/Objc preprocessor macros
      AC_DEFINE_UNQUOTED([GIT_PACKAGE_VERSION], ["${GIT_PACKAGE_VERSION}"], [package version determined from git repository])
      AC_DEFINE_UNQUOTED([PACKAGE_VERSION], ["${GIT_PACKAGE_VERSION}"], [package version determined from git repository])
      AC_DEFINE_UNQUOTED([VERSION], ["${GIT_PACKAGE_VERSION}"], [package version determined from git repository])
   fi
])dnl

# end of M4 file
