From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 16:30:27 +0200
Subject: [Buildroot] [PATCH 06 of 20] packages: rename
 FOO_INSTALL_TARGET_OPT into FOO_INSTALL_TARGET_OPTS
In-Reply-To: <625dd5f23fa4f1e9f9f6.1406668353@localhost>
References: <patchbomb.1406668347@localhost>
 <625dd5f23fa4f1e9f9f6.1406668353@localhost>
Message-ID: <20140914143027.GG3917@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-29 23:12 +0200, Thomas De Schampheleire spake thusly:
> To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
> make the same change for FOO_INSTALL_TARGET_OPT.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  boot/grub2/grub2.mk                                                                          |   2 +-
>  docs/manual/adding-packages-autotools.txt                                                    |   2 +-
>  docs/manual/adding-packages-cmake.txt                                                        |   2 +-
>  docs/manual/adding-packages-perl.txt                                                         |   2 +-
>  docs/manual/adding-packages-python.txt                                                       |   6 +++---
>  package/acl/acl.mk                                                                           |   2 +-
>  package/attr/attr.mk                                                                         |   2 +-
>  package/cups/cups.mk                                                                         |   2 +-
>  package/dmraid/dmraid.mk                                                                     |   2 +-
>  package/expat/expat.mk                                                                       |   2 +-
>  package/expect/expect.mk                                                                     |   2 +-
>  package/ifplugd/ifplugd.mk                                                                   |   2 +-
>  package/libdnet/libdnet.mk                                                                   |   2 +-
>  package/libelf/libelf.mk                                                                     |   2 +-
>  package/libseccomp/libseccomp.mk                                                             |   2 +-
>  package/lvm2/lvm2.mk                                                                         |   2 +-
>  package/mdadm/mdadm.mk                                                                       |   2 +-
>  package/mxml/mxml.mk                                                                         |   2 +-
>  package/netsnmp/netsnmp.mk                                                                   |   2 +-
>  package/php/php.mk                                                                           |   2 +-
>  package/pkg-autotools.mk                                                                     |   4 ++--
>  package/pkg-cmake.mk                                                                         |   4 ++--
>  package/pkg-perl.mk                                                                          |   8 ++++----
>  package/pkg-python.mk                                                                        |  12 ++++++------
>  package/quota/quota.mk                                                                       |   2 +-
>  package/rpm/rpm.mk                                                                           |   2 +-
>  package/rubix/rubix.mk                                                                       |   2 +-
>  package/samba/samba.mk                                                                       |   2 +-
>  package/screen/screen.mk                                                                     |   2 +-
>  package/sysstat/sysstat.mk                                                                   |   2 +-
>  package/util-linux/util-linux.mk                                                             |   2 +-
>  package/webkit/webkit.mk                                                                     |   2 +-
>  package/x11r7/xapp_xcalc/xapp_xcalc.mk                                                       |   2 +-
>  package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk                             |   2 +-
>  package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk                               |   2 +-
>  package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk               |   2 +-
>  package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk                 |   2 +-
>  package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk                 |   2 +-
>  package/x11r7/xfont_font-alias/xfont_font-alias.mk                                           |   2 +-
>  package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk                               |   2 +-
>  package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk                                   |   2 +-
>  package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk                                     |   2 +-
>  package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk |   2 +-
>  package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk   |   2 +-
>  package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk                                         |   2 +-
>  package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk                                     |   2 +-
>  package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk                     |   2 +-
>  package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk                       |   2 +-
>  package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk                       |   2 +-
>  package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk                       |   2 +-
>  package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk                               |   2 +-
>  package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk                               |   2 +-
>  package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk                                     |   2 +-
>  package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk                                   |   2 +-
>  package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk                                   |   2 +-
>  package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk                                     |   2 +-
>  package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk                                 |   2 +-
>  package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk                           |   2 +-
>  package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk                           |   2 +-
>  package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk                               |   2 +-
>  package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk                                   |   2 +-
>  package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk                                   |   2 +-
>  package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk                       |   2 +-
>  package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk                       |   2 +-
>  package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk                                   |   2 +-
>  package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk                                     |   2 +-
>  package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk                   |   2 +-
>  package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk                           |   2 +-
>  package/xenomai/xenomai.mk                                                                   |   2 +-
>  package/xfsprogs/xfsprogs.mk                                                                 |   2 +-
>  package/xscreensaver/xscreensaver.mk                                                         |   2 +-
>  package/xterm/xterm.mk                                                                       |   2 +-
>  72 files changed, 84 insertions(+), 84 deletions(-)
> 
> diff -r 565580d243a8 -r 625dd5f23fa4 boot/grub2/grub2.mk
> --- a/boot/grub2/grub2.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/boot/grub2/grub2.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -65,7 +65,7 @@
>  # directory, and the image generation process (below) will use the
>  # grub-mkimage tool and Grub2 modules from the host directory.
>  
> -GRUB2_INSTALL_TARGET_OPT = DESTDIR=$(HOST_DIR) install
> +GRUB2_INSTALL_TARGET_OPTS = DESTDIR=$(HOST_DIR) install
>  
>  define GRUB2_IMAGE_INSTALLATION
>  	mkdir -p $(dir $(GRUB2_IMAGE))
> diff -r 565580d243a8 -r 625dd5f23fa4 docs/manual/adding-packages-autotools.txt
> --- a/docs/manual/adding-packages-autotools.txt	Mon Jul 28 21:35:28 2014 +0200
> +++ b/docs/manual/adding-packages-autotools.txt	Tue Jul 29 21:58:06 2014 +0200
> @@ -153,7 +153,7 @@
>    correct for most autotools packages. It is still possible to override
>    it.
>  
> -* +LIBFOO_INSTALL_TARGET_OPT+ contains the make options
> +* +LIBFOO_INSTALL_TARGET_OPTS+ contains the make options
>    used to install the package to the target directory. By default, the
>    value is +DESTDIR=$(TARGET_DIR) install+. The default
>    value is correct for most autotools packages, but it is still possible
> diff -r 565580d243a8 -r 625dd5f23fa4 docs/manual/adding-packages-cmake.txt
> --- a/docs/manual/adding-packages-cmake.txt	Mon Jul 28 21:35:28 2014 +0200
> +++ b/docs/manual/adding-packages-cmake.txt	Tue Jul 29 21:58:06 2014 +0200
> @@ -117,7 +117,7 @@
>    is +DESTDIR=$(STAGING_DIR) install+, which is correct for most
>    CMake packages. It is still possible to override it.
>  
> -* +LIBFOO_INSTALL_TARGET_OPT+ contains the make options used to
> +* +LIBFOO_INSTALL_TARGET_OPTS+ contains the make options used to
>    install the package to the target directory. By default, the value
>    is +DESTDIR=$(TARGET_DIR) install+. The default value is correct
>    for most CMake packages, but it is still possible to override it if
> diff -r 565580d243a8 -r 625dd5f23fa4 docs/manual/adding-packages-perl.txt
> --- a/docs/manual/adding-packages-perl.txt	Mon Jul 28 21:35:28 2014 +0200
> +++ b/docs/manual/adding-packages-perl.txt	Tue Jul 29 21:58:06 2014 +0200
> @@ -109,7 +109,7 @@
>    options to pass to +make pure_all+ or +perl Build build+ in the build step.
>    By default, empty.
>  
> -* +PERL_FOO_INSTALL_TARGET_OPT+, to specify additional options to
> +* +PERL_FOO_INSTALL_TARGET_OPTS+, to specify additional options to
>    pass to +make pure_install+ or +perl Build install+ in the install step.
>    By default, empty.
>  
> diff -r 565580d243a8 -r 625dd5f23fa4 docs/manual/adding-packages-python.txt
> --- a/docs/manual/adding-packages-python.txt	Mon Jul 28 21:35:28 2014 +0200
> +++ b/docs/manual/adding-packages-python.txt	Tue Jul 29 21:58:06 2014 +0200
> @@ -127,15 +127,15 @@
>    packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPT+ options are already
>    passed automatically by the infrastructure.
>  
> -* +PYTHON_FOO_INSTALL_TARGET_OPT+, +PYTHON_FOO_INSTALL_STAGING_OPT+,
> +* +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPT+,
>    +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass
>    to the Python +setup.py+ script during the target installation step,
>    the staging installation step or the host installation,
>    respectively. Note that the infrastructure is automatically passing
> -  some options, defined in +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPT+
> +  some options, defined in +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS+
>    or +PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPT+ (for target distutils
>    packages), +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS+ (for host
> -  distutils packages), +PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPT+ or
> +  distutils packages), +PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS+ or
>    +PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPT+ (for target setuptools
>    packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS+ (for host
>    setuptools packages).
> diff -r 565580d243a8 -r 625dd5f23fa4 package/acl/acl.mk
> --- a/package/acl/acl.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/acl/acl.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -22,7 +22,7 @@
>  	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
>  	install-dev install-lib
>  
> -ACL_INSTALL_TARGET_OPT = 			\
> +ACL_INSTALL_TARGET_OPTS = 			\
>  	prefix=$(TARGET_DIR)/usr 		\
>  	exec_prefix=$(TARGET_DIR)/usr 		\
>  	install install-lib
> diff -r 565580d243a8 -r 625dd5f23fa4 package/attr/attr.mk
> --- a/package/attr/attr.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/attr/attr.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -21,7 +21,7 @@
>  	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib 	\
>  	install-dev install-lib
>  
> -ATTR_INSTALL_TARGET_OPT = 			\
> +ATTR_INSTALL_TARGET_OPTS = 			\
>  	prefix=$(TARGET_DIR)/usr 		\
>  	exec_prefix=$(TARGET_DIR)/usr 		\
>  	install install-lib
> diff -r 565580d243a8 -r 625dd5f23fa4 package/cups/cups.mk
> --- a/package/cups/cups.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/cups/cups.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  CUPS_LICENSE_FILES = LICENSE.txt
>  CUPS_INSTALL_STAGING = YES
>  CUPS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
> -CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
> +CUPS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
>  CUPS_CONF_OPT = --without-perl \
>  		--without-java \
>  		--without-php \
> diff -r 565580d243a8 -r 625dd5f23fa4 package/dmraid/dmraid.mk
> --- a/package/dmraid/dmraid.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/dmraid/dmraid.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  # lib and tools race with parallel make
>  DMRAID_MAKE = $(MAKE1)
>  DMRAID_INSTALL_STAGING = YES
> -DMRAID_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
> +DMRAID_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install
>  DMRAID_LICENSE = GPLv2
>  DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
>  
> diff -r 565580d243a8 -r 625dd5f23fa4 package/expat/expat.mk
> --- a/package/expat/expat.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/expat/expat.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -8,7 +8,7 @@
>  EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
>  EXPAT_INSTALL_STAGING = YES
>  EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
> -EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
> +EXPAT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) installlib
>  EXPAT_DEPENDENCIES = host-pkgconf
>  EXPAT_LICENSE = MIT
>  EXPAT_LICENSE_FILES = COPYING
> diff -r 565580d243a8 -r 625dd5f23fa4 package/expect/expect.mk
> --- a/package/expect/expect.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/expect/expect.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -15,6 +15,6 @@
>  EXPECT_CONF_OPT = --with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix
>  
>  # Since we don't want examples installed
> -EXPECT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR)  install-binaries
> +EXPECT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)  install-binaries
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/ifplugd/ifplugd.mk
> --- a/package/ifplugd/ifplugd.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/ifplugd/ifplugd.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  IFPLUGD_AUTORECONF = YES
>  
>  # install-strip unconditionally overwrites $(TARGET_DIR)/etc/ifplugd/ifplugd.*
> -IFPLUGD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
> +IFPLUGD_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
>  IFPLUGD_CONF_OPT = --disable-lynx --with-initdir=/etc/init.d/
>  IFPLUGD_DEPENDENCIES = libdaemon
>  
> diff -r 565580d243a8 -r 625dd5f23fa4 package/libdnet/libdnet.mk
> --- a/package/libdnet/libdnet.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/libdnet/libdnet.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -18,7 +18,7 @@
>  LIBDNET_DEPENDENCIES = python
>  LIBDNET_CONF_OPT += --with-python
>  LIBDNET_MAKE_OPTS = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
> -LIBDNET_INSTALL_TARGET_OPT = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
> +LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
>  LIBDNET_INSTALL_STAGING_OPT = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
>  endif
>  
> diff -r 565580d243a8 -r 625dd5f23fa4 package/libelf/libelf.mk
> --- a/package/libelf/libelf.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/libelf/libelf.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -8,7 +8,7 @@
>  LIBELF_SITE = http://www.mr511.de/software/
>  LIBELF_INSTALL_STAGING = YES
>  LIBELF_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
> -LIBELF_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install
> +LIBELF_INSTALL_TARGET_OPTS = instroot=$(TARGET_DIR) install
>  LIBELF_LICENSE = LGPLv2+
>  LIBELF_LICENSE_FILES = COPYING.LIB
>  
> diff -r 565580d243a8 -r 625dd5f23fa4 package/libseccomp/libseccomp.mk
> --- a/package/libseccomp/libseccomp.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/libseccomp/libseccomp.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -15,7 +15,7 @@
>  LIBSECCOMP_MAKE_ENV            = $(TARGET_CONFIGURE_OPTS)
>  LIBSECCOMP_MAKE_OPTS            = SUBDIRS_BUILD=src
>  LIBSECCOMP_INSTALL_STAGING_OPT = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(STAGING_DIR) install
> -LIBSECCOMP_INSTALL_TARGET_OPT  = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(TARGET_DIR) install
> +LIBSECCOMP_INSTALL_TARGET_OPTS  = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(TARGET_DIR) install
>  
>  # Not a real autotools package, but works quite OK nonetheless
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/lvm2/lvm2.mk
> --- a/package/lvm2/lvm2.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/lvm2/lvm2.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -34,7 +34,7 @@
>  ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),)
>  LVM2_MAKE_OPTS = device-mapper
>  LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install_device-mapper
> -LVM2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install_device-mapper
> +LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install_device-mapper
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LVM2_APP_LIBRARY),y)
> diff -r 565580d243a8 -r 625dd5f23fa4 package/mdadm/mdadm.mk
> --- a/package/mdadm/mdadm.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/mdadm/mdadm.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -13,7 +13,7 @@
>  MDADM_MAKE_OPTS = \
>  	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" CHECK_RUN_DIR=0 -C $(MDADM_DIR) mdadm
>  
> -MDADM_INSTALL_TARGET_OPT = \
> +MDADM_INSTALL_TARGET_OPTS = \
>  	DESTDIR=$(TARGET_DIR)/usr -C $(MDADM_DIR) install-mdadm
>  
>  define MDADM_CONFIGURE_CMDS
> diff -r 565580d243a8 -r 625dd5f23fa4 package/mxml/mxml.mk
> --- a/package/mxml/mxml.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/mxml/mxml.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,6 +11,6 @@
>  MXML_INSTALL_STAGING = YES
>  
>  MXML_INSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) install
> -MXML_INSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) install
> +MXML_INSTALL_TARGET_OPTS = DSTROOT=$(TARGET_DIR) install
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/netsnmp/netsnmp.mk
> --- a/package/netsnmp/netsnmp.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/netsnmp/netsnmp.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -25,7 +25,7 @@
>  		--with-out-transports="Unix" \
>  		--disable-manuals
>  NETSNMP_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
> -NETSNMP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
> +NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
>  NETSNMP_MAKE = $(MAKE1)
>  NETSNMP_CONFIG_SCRIPTS = net-snmp-config
>  
> diff -r 565580d243a8 -r 625dd5f23fa4 package/php/php.mk
> --- a/package/php/php.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/php/php.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -8,7 +8,7 @@
>  PHP_SITE = http://www.php.net/distributions
>  PHP_INSTALL_STAGING = YES
>  PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
> -PHP_INSTALL_TARGET_OPT = INSTALL_ROOT=$(TARGET_DIR) install
> +PHP_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
>  PHP_DEPENDENCIES = host-pkgconf
>  PHP_LICENSE = PHP
>  PHP_LICENSE_FILES = LICENSE
> diff -r 565580d243a8 -r 625dd5f23fa4 package/pkg-autotools.mk
> --- a/package/pkg-autotools.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/pkg-autotools.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -109,7 +109,7 @@
>  $(2)_MAKE_OPTS			?=
>  $(2)_INSTALL_OPTS		?= install
>  $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
> -$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
> +$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR)  install
>  
>  
>  #
> @@ -321,7 +321,7 @@
>  #
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_SRCDIR)
>  endef
>  endif
>  
> diff -r 565580d243a8 -r 625dd5f23fa4 package/pkg-cmake.mk
> --- a/package/pkg-cmake.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/pkg-cmake.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -43,7 +43,7 @@
>  $(2)_MAKE_OPTS			?=
>  $(2)_INSTALL_HOST_OPT		?= install
>  $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
> -$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
> +$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
>  
>  $(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
>  $(2)_BUILDDIR			= $$($(2)_SRCDIR)
> @@ -144,7 +144,7 @@
>  #
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  
> diff -r 565580d243a8 -r 625dd5f23fa4 package/pkg-perl.mk
> --- a/package/pkg-perl.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/pkg-perl.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -154,9 +154,9 @@
>  ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
>  	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
> -		perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
> +		perl Build $$($(2)_INSTALL_TARGET_OPTS) install; \
>  	else \
> -		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
> +		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPTS) pure_install; \
>  	fi
>  endef
>  endif
> @@ -168,9 +168,9 @@
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
>  	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
> -		perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
> +		perl Build $$($(2)_INSTALL_TARGET_OPTS) install; \
>  	else \
> -		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
> +		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPTS) pure_install; \
>  	fi
>  endef
>  endif
> diff -r 565580d243a8 -r 625dd5f23fa4 package/pkg-python.mk
> --- a/package/pkg-python.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/pkg-python.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -35,7 +35,7 @@
>  PKG_PYTHON_DISTUTILS_BUILD_OPT = \
>  	--executable=/usr/bin/python
>  
> -PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPT = \
> +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
>  	--prefix=$(TARGET_DIR)/usr
>  
>  PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPT = \
> @@ -56,7 +56,7 @@
>  	_python_prefix=/usr \
>  	_python_exec_prefix=/usr
>  
> -PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPT = \
> +PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
>  	--prefix=$(TARGET_DIR)/usr \
>  	--executable=/usr/bin/python \
>  	--single-version-externally-managed \
> @@ -112,7 +112,7 @@
>  $(2)_BASE_ENV         = $$(PKG_PYTHON_DISTUTILS_ENV)
>  $(2)_BASE_BUILD_TGT   = build
>  $(2)_BASE_BUILD_OPT   = $$(PKG_PYTHON_DISTUTILS_BUILD_OPT)
> -$(2)_BASE_INSTALL_TARGET_OPT  = $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPT)
> +$(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
>  $(2)_BASE_INSTALL_STAGING_OPT = $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPT)
>  else
>  $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
> @@ -126,7 +126,7 @@
>  $(2)_BASE_ENV         = $$(PKG_PYTHON_SETUPTOOLS_ENV)
>  $(2)_BASE_BUILD_TGT   = build
>  $(2)_BASE_BUILD_OPT   =
> -$(2)_BASE_INSTALL_TARGET_OPT  = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPT)
> +$(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
>  $(2)_BASE_INSTALL_STAGING_OPT = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPT)
>  else
>  $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
> @@ -254,8 +254,8 @@
>  	(cd $$($$(PKG)_BUILDDIR)/; \
>  		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
>  		$$($(2)_PYTHON_INTERPRETER) setup.py install \
> -		$$($$(PKG)_BASE_INSTALL_TARGET_OPT) \
> -		$$($$(PKG)_INSTALL_TARGET_OPT))
> +		$$($$(PKG)_BASE_INSTALL_TARGET_OPTS) \
> +		$$($$(PKG)_INSTALL_TARGET_OPTS))
>  endef
>  endif
>  
> diff -r 565580d243a8 -r 625dd5f23fa4 package/quota/quota.mk
> --- a/package/quota/quota.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/quota/quota.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -29,7 +29,7 @@
>  	CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
>  
>  # Package uses autoconf but not automake.
> -QUOTA_INSTALL_TARGET_OPT = \
> +QUOTA_INSTALL_TARGET_OPTS = \
>  	ROOTDIR=$(TARGET_DIR) \
>  	install
>  
> diff -r 565580d243a8 -r 625dd5f23fa4 package/rpm/rpm.mk
> --- a/package/rpm/rpm.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/rpm/rpm.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -47,6 +47,6 @@
>  
>  RPM_MAKE = $(MAKE1)
>  
> -RPM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) program_transform_name= install
> +RPM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) program_transform_name= install
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/rubix/rubix.mk
> --- a/package/rubix/rubix.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/rubix/rubix.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -7,7 +7,7 @@
>  RUBIX_VERSION = 1.0.5
>  RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
>  RUBIX_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Rubix
> -RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
> +RUBIX_INSTALL_TARGET_OPTS = GAMESDIR=$(TARGET_DIR)/usr/games install
>  RUBIX_LICENSE = Public Domain
>  RUBIX_LICENSE_FILES = LICENCE
>  
> diff -r 565580d243a8 -r 625dd5f23fa4 package/samba/samba.mk
> --- a/package/samba/samba.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/samba/samba.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -60,7 +60,7 @@
>  	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),--with-readline=$(STAGING_DIR)) \
>  	$(if $(BR2_PACKAGE_SAMBA_WINBINDD),--with-winbind,--without-winbind)
>  
> -SAMBA_INSTALL_TARGET_OPT = \
> +SAMBA_INSTALL_TARGET_OPTS = \
>  	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
>  	installlibs installservers installbin installscripts \
>  	$(if $(BR2_PACKAGE_SAMBA_SWAT),installswat)
> diff -r 565580d243a8 -r 625dd5f23fa4 package/screen/screen.mk
> --- a/package/screen/screen.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/screen/screen.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -12,7 +12,7 @@
>  SCREEN_CONF_ENV = ac_cv_header_elf_h=no ac_cv_header_dwarf_h=no \
>  	CFLAGS="$(TARGET_CFLAGS) -DTERMINFO"
>  SCREEN_MAKE = $(MAKE1)
> -SCREEN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
> +SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
>  
>  define SCREEN_INSTALL_SCREENRC
>  	if [ ! -f $(TARGET_DIR)/etc/screenrc ]; then \
> diff -r 565580d243a8 -r 625dd5f23fa4 package/sysstat/sysstat.mk
> --- a/package/sysstat/sysstat.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/sysstat/sysstat.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -19,6 +19,6 @@
>  
>  # The isag tool is a post processing script that depends on tcl/tk
>  # among other things. So we don't install it.
> -SYSSTAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALL_ISAG=n install
> +SYSSTAT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) INSTALL_ISAG=n install
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/util-linux/util-linux.mk
> --- a/package/util-linux/util-linux.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/util-linux/util-linux.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -140,5 +140,5 @@
>  # MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
>  # one, so it disappears
>  UTIL_LINUX_INSTALL_STAGING_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
> -UTIL_LINUX_INSTALL_TARGET_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
> +UTIL_LINUX_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
>  HOST_UTIL_LINUX_INSTALL_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
> diff -r 565580d243a8 -r 625dd5f23fa4 package/webkit/webkit.mk
> --- a/package/webkit/webkit.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/webkit/webkit.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -21,7 +21,7 @@
>  
>  # parallel make install deadlocks with make 3.81
>  WEBKIT_INSTALL_STAGING_OPT = -j1 DESTDIR=$(STAGING_DIR) install
> -WEBKIT_INSTALL_TARGET_OPT = -j1 DESTDIR=$(TARGET_DIR) install
> +WEBKIT_INSTALL_TARGET_OPTS = -j1 DESTDIR=$(TARGET_DIR) install
>  
>  # Does not build and it's disabled by default
>  # in newer releases
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xapp_xcalc/xapp_xcalc.mk
> --- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -9,7 +9,7 @@
>  XAPP_XCALC_SITE = http://xorg.freedesktop.org/releases/individual/app
>  XAPP_XCALC_LICENSE = MIT
>  XAPP_XCALC_LICENSE_FILES = COPYING
> -XAPP_XCALC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec install-data
> +XAPP_XCALC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec install-data
>  XAPP_XCALC_DEPENDENCIES = xlib_libXaw
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
> --- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_ADOBE_100DPI_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
> --- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_ADOBE_75DPI_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
> --- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
> --- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
> --- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_ADOBE_UTOPIA_TYPE1_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-alias/xfont_font-alias.mk
> --- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_ALIAS_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_ALIAS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_ALIAS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_ALIAS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
> --- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_ARABIC_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
> --- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_BH_100DPI_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
> --- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_BH_75DPI_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
> --- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
> --- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
> --- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_BH_TTF_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_BH_TTF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_BH_TTF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_BH_TTF_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
> --- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_BH_TYPE1_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
> --- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_BITSTREAM_100DPI_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
> --- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_BITSTREAM_75DPI_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
> --- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_BITSTREAM_TYPE1_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
> --- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_CRONYX_CYRILLIC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
> --- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_CURSOR_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
> --- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -10,7 +10,7 @@
>  XFONT_FONT_DAEWOO_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
> --- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_DEC_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
> --- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_IBM_TYPE1_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
> --- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_ISAS_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
> --- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -10,7 +10,7 @@
>  XFONT_FONT_JIS_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
> --- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_MICRO_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
> --- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_MISC_CYRILLIC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
> --- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_MISC_ETHIOPIC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
> --- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_MISC_MELTHO_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
> --- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_MISC_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
> --- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_MUTT_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
> --- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_SCHUMACHER_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
> --- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_SCREEN_CYRILLIC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
> --- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_SONY_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
> --- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_SUN_MISC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
> --- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_WINITZKI_CYRILLIC_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
> --- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -11,7 +11,7 @@
>  XFONT_FONT_XFREE86_TYPE1_LICENSE_FILES = COPYING
>  
>  XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
> -XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
> +XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
>  XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/xenomai/xenomai.mk
> --- a/package/xenomai/xenomai.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/xenomai/xenomai.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -16,7 +16,7 @@
>  XENOMAI_LICENSE_FILES = debian/copyright include/COPYING src/skins/native/COPYING ksrc/nucleus/COPYING
>  
>  XENOMAI_INSTALL_STAGING = YES
> -XENOMAI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-user
> +XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
>  XENOMAI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-user
>  
>  XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/ --disable-doc-install
> diff -r 565580d243a8 -r 625dd5f23fa4 package/xfsprogs/xfsprogs.mk
> --- a/package/xfsprogs/xfsprogs.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/xfsprogs/xfsprogs.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -16,6 +16,6 @@
>  	INSTALL_USER=root \
>  	INSTALL_GROUP=root
>  
> -XFSPROGS_INSTALL_TARGET_OPT = DIST_ROOT=$(TARGET_DIR) install
> +XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/xscreensaver/xscreensaver.mk
> --- a/package/xscreensaver/xscreensaver.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/xscreensaver/xscreensaver.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -22,6 +22,6 @@
>  	--includedir=$(STAGING_DIR)/usr/include \
>  	--libdir=$(STAGING_DIR)/usr/lib
>  
> -XSCREENSAVER_INSTALL_TARGET_OPT = install_prefix="$(TARGET_DIR)" install
> +XSCREENSAVER_INSTALL_TARGET_OPTS = install_prefix="$(TARGET_DIR)" install
>  
>  $(eval $(autotools-package))
> diff -r 565580d243a8 -r 625dd5f23fa4 package/xterm/xterm.mk
> --- a/package/xterm/xterm.mk	Mon Jul 28 21:35:28 2014 +0200
> +++ b/package/xterm/xterm.mk	Tue Jul 29 21:58:06 2014 +0200
> @@ -8,7 +8,7 @@
>  XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
>  XTERM_SITE = ftp://invisible-island.net/xterm
>  XTERM_DEPENDENCIES = ncurses xlib_libXaw
> -XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
> +XTERM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install
>  XTERM_LICENSE = MIT
>  XTERM_LICENSE_FILES = version.c
>  

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
