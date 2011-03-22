#
#   Visa Single Sign-on System
#   Copyright (C) 2011 Bindle Binaries <syzdek@bindlebinaries.com>.
#
#   @BINDLE_BINARIES_BSD_LICENSE_START@
#
#   Redistribution and use in source and binary forms, with or without
#   modification, are permitted provided that the following conditions are
#   met:
#
#      * Redistributions of source code must retain the above copyright
#        notice, this list of conditions and the following disclaimer.
#      * Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#      * Neither the name of Bindle Binaries nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
#   IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
#   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
#   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL BINDLE BINARIES BE LIABLE FOR
#   ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#   SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#   LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#   OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
#   SUCH DAMAGE.
#
#   @BINDLE_BINARIES_BSD_LICENSE_END@
#
#   @configure_input@
#
#   Makefile.am - automate compiling on a unix platform
#

# Sub directories
SUBDIRS					=
DIST_SUBDIRS				=


# install directories
localedir				= $(datadir)/locale
moduledir				= $(libexecdir)/$(PACKAGE_TARNAME)


# global flags
AM_LDFLAGS				= -L$(builddir)/lib
AM_LIBS					= $(LTLIBINTL)
AM_CFLAGS				= -W -Wall -Werror -O2
AM_CPPFLAGS				= $(CFLAGS_WARNINGS) \
					  -I$(top_srcdir)/include \
					  -I$(top_builddir)/include \
					  -DLIBEXECDIR="\"$(libexecdir)\"" \
					  -DMODULEDIR="\"$(moduledir)\"" \
					  -DSYSCONFDIR="\"$(sysconfdir)\""
AM_LIBTOOLFLAGS				=
ACLOCAL_AMFLAGS				= -I m4
DEFS					= -DLOCALEDIR="\"$(localedir)\"" @DEFS@


# items to build
bin_PROGRAMS				=
include_HEADERS				=
info_TEXINFOS				= doc/readme.texi
lib_LTLIBRARIES				=
man_MANS				=
sbin_PROGRAMS				=
sysconf_DATA				=


# macros for doc/readme.info
doc_readme_TEXINFOS			= doc/readme.texi \
					  doc/titlepage.texi \
					  doc/version-readme.texi


# miscellaneous lists
CLEANFILES				= $(builddir)/a.out   $(srcdir)/a.out \
					  $(builddir)/*/a.out $(srcdir)/*/a.out \
					  config.h.in~ $(srcdir)/config.h.in~ \
					  stamp-vti $(srcdir)/stamp-vti \
					  $(man_MANS) \
					  @PACKAGE_TARNAME@-*.tar.* \
					  @PACKAGE_TARNAME@-*.zip
EXTRA_DIST				= COPYING.DOC \
					  COPYING.LIB \
					  build-aux/git-package-version \
					  visa.tags
EXTRA_PROGRAMS				=
EXTRA_TEXINFOS				=
TESTS					=
XFAIL_TESTS				=


# substitution routine
do_subst = sed \
		-e 's,[@]SHELL[@],@SHELL@,g' \
		-e 's,[@]PACKAGE_VERSION[@],@PACKAGE_VERSION@,g' \
		-e 's,[@]PACKAGE_NAME[@],@PACKAGE_NAME@,g' \
		-e 's,[@]PACKAGE_TARNAME[@],@PACKAGE_TARNAME@,g' \
		-e 's,[@]PACKAGE_BUGREPORT[@],@PACKAGE_BUGREPORT@,g' \
		-e 's,[@]GIT_PACKAGE_VERSION[@],@GIT_PACKAGE_VERSION@,g' \
		-e 's,[@]INSTALL[@],$(INSTALL),g' \
		-e 's,[@]INSTALL_PROGRAM[@],$(INSTALL_PROGRAM),g' \
		-e 's,[@]INSTALL_SCRIPT[@],$(INSTALL_SCRIPT),g' \
		-e 's,[@]INSTALL_DATA[@],$(INSTALL_DATA),g' \
		-e 's,[@]prefix[@],$(prefix),g' \
		-e 's,[@]datadir[@],$(datadir),g' \
		-e 's,[@]sysconfdir[@],$(sysconfdir),g' \
		-e 's,[@]moduledir[@],$(moduledir),g'
do_subst_fn = \
		echo "do_subst < ${@}.in > ${@}"; \
		mkdir -p `dirname ${@}` || exit 1; \
		${do_subst} < $(srcdir)/${@}.in > ${@} || exit 1; \
		chmod 0755 ${@}
do_subst_dt = \
		echo "do_subst < ${@}.in > ${@}"; \
		mkdir -p `dirname ${@}` || exit 1; \
		${do_subst} < $(srcdir)/${@}.in > ${@} || exit 1; \
		chmod 0644 ${@}


# custom targets
build-aux/git-package-version:
	mkdir -p build-aux
	echo $(PACKAGE_VERSION) > $(srcdir)/build-aux/git-package-version


# local targets
clean-local:

distclean-local:
	-rm -fR $(srcdir)/autom4te.cache	# removes autoconf cache

install-exec-local:

install-data-local:

install-exec-hook:

install-data-hook:

uninstall-local:

uninstall-hook:

# end of autmake script
