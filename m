From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  5 Jul 2008 23:19:13 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atstk100x
Message-ID: <20080706061913.815EC3C667@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-05 23:19:12 -0700 (Sat, 05 Jul 2008)
New Revision: 22658

Log:
Update atstk100x defconfig

Modified:
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2008-07-05 21:57:23 UTC (rev 22657)
+++ trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2008-07-06 06:19:12 UTC (rev 22658)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Sat Jul  5 00:11:52 2008
+# Sat Jul  5 10:08:08 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -303,7 +303,7 @@
 BR2_BUSYBOX_VERSION="1.11.0"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="target/device/Atmel/atstk100x/busybox-1.9.1.config"
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+# BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
 #
@@ -311,10 +311,17 @@
 #
 BR2_PACKAGE_BASH=y
 BR2_PACKAGE_BZIP2=y
+# BR2_PACKAGE_COREUTILS is not set
 # BR2_PACKAGE_DIFFUTILS is not set
+# BR2_PACKAGE_FINDUTILS is not set
 # BR2_PACKAGE_FLEX is not set
+# BR2_PACKAGE_GAWK is not set
 # BR2_PACKAGE_GCC_TARGET is not set
+# BR2_PACKAGE_GREP is not set
 # BR2_PACKAGE_MAKE is not set
+# BR2_PACKAGE_PATCH is not set
+# BR2_PACKAGE_SED is not set
+# BR2_PACKAGE_TAR is not set
 
 #
 # Other development stuff
@@ -346,6 +353,7 @@
 # BR2_PACKAGE_BEECRYPT is not set
 # BR2_PACKAGE_BERKELEYDB is not set
 # BR2_PACKAGE_BSDIFF is not set
+# BR2_PACKAGE_BOOTUTILS is not set
 # BR2_PACKAGE_CUPS is not set
 # BR2_PACKAGE_CUSTOMIZE is not set
 # BR2_PACKAGE_DASH is not set
@@ -354,6 +362,7 @@
 # BR2_PACKAGE_ICU is not set
 # BR2_PACKAGE_IPKG is not set
 # BR2_PACKAGE_KEXEC is not set
+# BR2_PACKAGE_LESS is not set
 BR2_PACKAGE_LIBDAEMON=y
 # BR2_PACKAGE_LIBELF is not set
 # BR2_PACKAGE_LIBEVENT is not set
@@ -368,16 +377,31 @@
 # BR2_PACKAGE_LTP-TESTSUITE is not set
 # BR2_PACKAGE_LTRACE is not set
 # BR2_PACKAGE_LTT is not set
+# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
+# BR2_PACKAGE_MODUTILS is not set
 # BR2_PACKAGE_NG_SPICE_REWORK is not set
 # BR2_PACKAGE_POPT is not set
 # BR2_PACKAGE_PORTAGE is not set
+# BR2_PACKAGE_PROCPS is not set
+# BR2_PACKAGE_PSMISC is not set
+# BR2_PACKAGE_RPM is not set
 # BR2_PACKAGE_SCREEN is not set
 # BR2_PACKAGE_SQLITE is not set
 # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
 BR2_PACKAGE_STRACE=y
 # BR2_PACKAGE_SUDO is not set
+# BR2_PACKAGE_SYSKLOGD is not set
+# BR2_PACKAGE_SYSVINIT is not set
+# BR2_PACKAGE_TINYLOGIN is not set
+# BR2_PACKAGE_UTIL-LINUX is not set
+# BR2_PACKAGE_WHICH is not set
 BR2_DATABASE_SUPPORT=y
 # BR2_PACKAGE_MYSQL_CLIENT is not set
+BR2_TEXTEDIT_SUPPORT=y
+# BR2_PACKAGE_ED is not set
+# BR2_PACKAGE_NANO is not set
+# BR2_PACKAGE_UEMACS is not set
+# BR2_PACKAGE_VIM is not set
 BR2_NETWORK_SUPPORT=y
 
 #
@@ -399,6 +423,7 @@
 # BR2_PACKAGE_BRIDGE is not set
 # BR2_PACKAGE_CURL is not set
 # BR2_PACKAGE_LIBCURL is not set
+# BR2_PACKAGE_ISC_DHCP is not set
 # BR2_PACKAGE_DNSMASQ is not set
 BR2_PACKAGE_DROPBEAR=y
 # BR2_PACKAGE_ETHTOOL is not set
@@ -442,6 +467,7 @@
 # BR2_PACKAGE_NCFTP_SPOOLER is not set
 # BR2_PACKAGE_NCFTP_BOOKMARKS is not set
 # BR2_PACKAGE_NEON is not set
+# BR2_PACKAGE_NETCAT is not set
 # BR2_PACKAGE_NETKITBASE is not set
 # BR2_PACKAGE_NETKITTELNET is not set
 # BR2_PACKAGE_NETPLUG is not set
@@ -452,7 +478,8 @@
 # BR2_PACKAGE_OLSR is not set
 # BR2_PACKAGE_OPENNTPD is not set
 # BR2_PACKAGE_OPENSSH is not set
-# BR2_PACKAGE_OPENSSL is not set
+BR2_PACKAGE_OPENSSL=y
+# BR2_PACKAGE_OPENSSL_TARGET_HEADERS is not set
 # BR2_PACKAGE_OPENVPN is not set
 # BR2_PACKAGE_OPENSWAN is not set
 BR2_PACKAGE_PORTMAP=y
@@ -480,6 +507,17 @@
 # BR2_PACKAGE_TCPDUMP is not set
 # BR2_PACKAGE_DHCPDUMP is not set
 # BR2_PACKAGE_TFTPD is not set
+BR2_PACKAGE_LIGHTTPD=y
+
+#
+# lighttpd packages
+#
+BR2_PACKAGE_LIGHTTPD_OPENSSL=y
+BR2_PACKAGE_LIGHTTPD_ZLIB=y
+BR2_PACKAGE_LIGHTTPD_BZIP2=y
+# BR2_PACKAGE_LIGHTTPD_PCRE is not set
+# BR2_PACKAGE_THTTPD is not set
+# BR2_PACKAGE_TINYHTTPD is not set
 # BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TTCP is not set
 # BR2_PACKAGE_UDPCAST is not set
@@ -489,6 +527,7 @@
 #
 # BR2_PACKAGE_VTUN is not set
 # BR2_PACKAGE_WEBIF is not set
+# BR2_PACKAGE_WGET is not set
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_BLOCKDEV_SUPPORT=y
 
@@ -504,6 +543,8 @@
 # BR2_PACKAGE_LIBFUSE is not set
 # BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
+# BR2_PACKAGE_HDPARM is not set
+# BR2_PACKAGE_HOTPLUG is not set
 # BR2_PACKAGE_HWDATA is not set
 # BR2_PACKAGE_I2C_TOOLS is not set
 # BR2_PACKAGE_INPUT_TOOLS is not set
@@ -549,7 +590,9 @@
 # BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_RAIDTOOLS is not set
 # BR2_PACKAGE_SETSERIAL is not set
+# BR2_PACKAGE_SFDISK is not set
 # BR2_PACKAGE_SMARTMONTOOLS is not set
+# BR2_PACKAGE_UDEV is not set
 # BR2_PACKAGE_USBMOUNT is not set
 # BR2_PACKAGE_USBUTILS is not set
 # BR2_PACKAGE_WIPE is not set
@@ -734,6 +777,7 @@
 BR2_PACKAGE_MPLAYER=y
 # BR2_PACKAGE_VLC is not set
 BR2_COMPRESSOR_SUPPORT=y
+# BR2_PACKAGE_GZIP is not set
 BR2_PACKAGE_LZO=y
 # BR2_PACKAGE_LZMA_TARGET is not set
 # BR2_PACKAGE_LZMA_HOST is not set
