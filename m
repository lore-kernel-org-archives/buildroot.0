From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 11 Jul 2007 07:20:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: dbus tcpdump
Message-ID: <20070711142050.EE4DAA65BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-11 07:20:47 -0700 (Wed, 11 Jul 2007)
New Revision: 19062

Log:
Use <package>_VERSION in all <package>.mk instead of <package>_VER

Modified:
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/tcpdump/dhcpdump.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-07-11 14:06:06 UTC (rev 19061)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-07-11 14:20:47 UTC (rev 19062)
@@ -3,10 +3,10 @@
 # dbus
 #
 #############################################################
-DBUS_VER:=1.1.1
-DBUS_SOURCE:=dbus-$(DBUS_VER).tar.gz
+DBUS_VERSION:=1.1.1
+DBUS_SOURCE:=dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE:=http://dbus.freedesktop.org/releases/dbus/
-DBUS_DIR:=$(BUILD_DIR)/dbus-$(DBUS_VER)
+DBUS_DIR:=$(BUILD_DIR)/dbus-$(DBUS_VERSION)
 DBUS_CAT:=$(ZCAT)
 DBUS_BINARY:=bus/dbus-daemon
 DBUS_TARGET_BINARY:=usr/bin/dbus-daemon

Modified: trunk/buildroot/package/tcpdump/dhcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/dhcpdump.mk	2007-07-11 14:06:06 UTC (rev 19061)
+++ trunk/buildroot/package/tcpdump/dhcpdump.mk	2007-07-11 14:20:47 UTC (rev 19062)
@@ -6,10 +6,10 @@
 # Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
 # Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
 
-DHCPDUMP_VER:=1.7
-DHCPDUMP_DIR:=$(BUILD_DIR)/dhcpdump-$(DHCPDUMP_VER)
+DHCPDUMP_VERSION:=1.7
+DHCPDUMP_DIR:=$(BUILD_DIR)/dhcpdump-$(DHCPDUMP_VERSION)
 DHCPDUMP_SITE:=http://www.mavetju.org/download/
-DHCPDUMP_SOURCE:=dhcpdump-$(DHCPDUMP_VER).tar.gz
+DHCPDUMP_SOURCE:=dhcpdump-$(DHCPDUMP_VERSION).tar.gz
 DHCPDUMP_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(DHCPDUMP_SOURCE):
