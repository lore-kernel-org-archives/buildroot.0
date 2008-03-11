From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 11:17:03 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atngw100-expanded
Message-ID: <20080311181703.64F9A12C5CF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 11:17:02 -0700 (Tue, 11 Mar 2008)
New Revision: 21302

Log:
updated defconfig


Modified:
   trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100_expanded_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100_expanded_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100_expanded_defconfig	2008-03-11 18:15:30 UTC (rev 21301)
+++ trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100_expanded_defconfig	2008-03-11 18:17:02 UTC (rev 21302)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Feb 29 07:33:04 2008
+# Mon Mar 10 08:11:54 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -277,7 +277,6 @@
 # BR2_PACKAGE_CVS is not set
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
-BR2_PACKAGE_EXPAT=y
 # BR2_PACKAGE_FAKEROOT is not set
 BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
@@ -289,7 +288,6 @@
 BR2_PACKAGE_PKGCONFIG=y
 BR2_READLINE=y
 # BR2_PACKAGE_READLINE_TARGET is not set
-# BR2_PACKAGE_XERCES is not set
 
 #
 # Other stuff
@@ -297,19 +295,14 @@
 # BR2_PACKAGE_AT is not set
 # BR2_PACKAGE_BERKELEYDB is not set
 # BR2_PACKAGE_BSDIFF is not set
+BR2_PACKAGE_CUPS=y
 # BR2_PACKAGE_CUSTOMIZE is not set
 # BR2_PACKAGE_DASH is not set
-# BR2_PACKAGE_FCONFIG is not set
 # BR2_PACKAGE_FILE is not set
-# BR2_PACKAGE_FIS is not set
-# BR2_PACKAGE_KEXEC is not set
+BR2_PACKAGE_GAMIN=y
 BR2_PACKAGE_ICU=y
 BR2_PACKAGE_IPKG=y
-BR2_PACKAGE_CUPS=y
-BR2_PACKAGE_NG_SPICE_REWORK=y
-BR2_PACKAGE_GAMIN=y
-BR2_PACKAGE_STARTUP_NOTIFICATION=y
-# BR2_JAVA_SUPPORT is not set
+# BR2_PACKAGE_KEXEC is not set
 BR2_PACKAGE_LIBDAEMON=y
 # BR2_PACKAGE_LIBELF is not set
 # BR2_PACKAGE_LIBEVENT is not set
@@ -318,16 +311,15 @@
 # BR2_PACKAGE_LIBGPG_ERROR is not set
 # BR2_PACKAGE_LIBLOCKFILE is not set
 # BR2_PACKAGE_LIBSYSFS is not set
-BR2_PACKAGE_LIBXML2=y
-# BR2_PACKAGE_LIBXML2_TARGET_HEADERS is not set
-BR2_PACKAGE_LIBXSLT=y
 # BR2_PACKAGE_LOCKFILE_PROGS is not set
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
 # BR2_PACKAGE_LTRACE is not set
 # BR2_PACKAGE_LTT is not set
+BR2_PACKAGE_NG_SPICE_REWORK=y
 # BR2_PACKAGE_PORTAGE is not set
 BR2_PACKAGE_SQLITE=y
+BR2_PACKAGE_STARTUP_NOTIFICATION=y
 BR2_PACKAGE_STRACE=y
 # BR2_PACKAGE_SUDO is not set
 BR2_NETWORK_SUPPORT=y
@@ -346,12 +338,13 @@
 BR2_PACKAGE_CURL=y
 # BR2_PACKAGE_LIBCURL is not set
 BR2_PACKAGE_DNSMASQ=y
+# BR2_PACKAGE_DNSMASQ_TFTP is not set
 BR2_PACKAGE_DROPBEAR=y
 # BR2_PACKAGE_ETHTOOL is not set
 BR2_PACKAGE_HASERL=y
 # BR2_PACKAGE_HASERL_VERSION_0_8_0 is not set
-BR2_PACKAGE_HASERL_VERSION_0_9_21=y
-BR2_PACKAGE_HASERL_VERSION="0.9.21"
+BR2_PACKAGE_HASERL_VERSION_0_9_22=y
+BR2_PACKAGE_HASERL_VERSION="0.9.22"
 # BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
@@ -436,6 +429,8 @@
 # BR2_PACKAGE_DM is not set
 # BR2_PACKAGE_DMRAID is not set
 # BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_FCONFIG is not set
+# BR2_PACKAGE_FIS is not set
 # BR2_PACKAGE_LIBFUSE is not set
 # BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
@@ -454,6 +449,7 @@
 # BR2_PACKAGE_MTD_20061007 is not set
 # BR2_PACKAGE_MTD_20050122 is not set
 # BR2_PACKAGE_MTD_SNAPSHOT is not set
+BR2_PACKAGE_MTD_ORIG_STRING="mtd-utils-1.1.0.tar.bz2"
 
 #
 # MTD tools selection
@@ -553,6 +549,7 @@
 BR2_PACKAGE_LIBPNG=y
 # BR2_PACKAGE_LIBUNGIF is not set
 # BR2_PACKAGE_SDL is not set
+# BR2_PACKAGE_SDL_MIXER is not set
 # BR2_PACKAGE_SDL_TTF is not set
 BR2_PACKAGE_TIFF=y
 
@@ -886,13 +883,14 @@
 #
 # BR2_PACKAGE_XUTIL_MAKEDEPEND is not set
 BR2_PACKAGE_XUTIL_UTIL_MACROS=y
+BR2_PACKAGE_MCOOKIE=y
 
 #
 # X11R7 Other data
 #
 BR2_PACKAGE_XDATA_XBITMAPS=y
 BR2_PACKAGE_XDATA_XCURSOR_THEMES=y
-BR2_PACKAGE_XDATA_XKBDATA=y
+BR2_PACKAGE_XKEYBOARD_CONFIG=y
 
 #
 # X libraries and helper libraries
@@ -913,13 +911,13 @@
 # BR2_PACKAGE_GTK2_THEME_HICOLOR is not set
 BR2_PACKAGE_LIBSEXY=y
 BR2_PACKAGE_FLTK=y
+BR2_PACKAGE_OPENMOTIF=y
 BR2_PACKAGE_FONTCONFIG=y
 BR2_PACKAGE_FREETYPE=y
 BR2_FREETYPE_VERSION_2_2_1=y
 # BR2_FREETYPE_VERSION_2_3_5 is not set
 BR2_FREETYPE_VERSION="2.2.1"
 BR2_PACKAGE_TSLIB=y
-BR2_PACKAGE_OPENMOTIF=y
 
 #
 # X Window managers
@@ -948,6 +946,7 @@
 BR2_PACKAGE_SYLPHEED=y
 BR2_PACKAGE_XPDF=y
 BR2_PACKAGE_X11VNC=y
+BR2_PACKAGE_XVKBD=y
 
 #
 # Video libraries/codecs and applications
@@ -960,19 +959,25 @@
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
 # BR2_SCRIPTING_SUPPORT is not set
+BR2_XML_SUPPORT=y
+BR2_PACKAGE_EXPAT=y
+# BR2_PACKAGE_EZXML is not set
+BR2_PACKAGE_LIBXML2=y
+# BR2_PACKAGE_LIBXML2_TARGET_HEADERS is not set
+BR2_PACKAGE_LIBXSLT=y
+# BR2_PACKAGE_XERCES is not set
+# BR2_JAVA_SUPPORT is not set
 BR2_GAMES=y
 BR2_PACKAGE_LXDOOM=y
 BR2_PACKAGE_LXDOOM_WAD=y
 BR2_PACKAGE_ACE_OF_PENGUINS=y
 BR2_PACKAGE_GNUCHESS=y
 BR2_PACKAGE_XBOARD=y
+BR2_PACKAGE_RUBIX=y
+BR2_PACKAGE_MAGICCUBE4D=y
+BR2_PACKAGE_VICE=y
 
 #
-# Editors
-#
-# BR2_PACKAGE_VIM is not set
-
-#
 # Target filesystem options
 #
 
@@ -1013,7 +1018,6 @@
 #
 # bootloader for target device
 #
-# BR2_TARGET_U_BOOT is not set
 
 #
 # Kernel
