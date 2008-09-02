From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  2 Sep 2008 04:07:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bridge-utils
Message-ID: <20080902110755.B30963C66F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-02 04:07:55 -0700 (Tue, 02 Sep 2008)
New Revision: 23303

Log:
bridge: bump version

Upstream tarball doesn't include configure, so run autoreconf.

Modified:
   trunk/buildroot/package/bridge-utils/bridge.mk


Changeset:
Modified: trunk/buildroot/package/bridge-utils/bridge.mk
===================================================================
--- trunk/buildroot/package/bridge-utils/bridge.mk	2008-09-02 11:07:49 UTC (rev 23302)
+++ trunk/buildroot/package/bridge-utils/bridge.mk	2008-09-02 11:07:55 UTC (rev 23303)
@@ -4,9 +4,10 @@
 #
 #############################################################
 #
-BRIDGE_VERSION:=1.0.6
+BRIDGE_VERSION:=1.4
 BRIDGE_SOURCE:=bridge-utils-$(BRIDGE_VERSION).tar.gz
 BRIDGE_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bridge/
+BRIDGE_AUTORECONF:=YES
 BRIDGE_INSTALL_STAGING:=NO
 BRIDGE_INSTALL_TARGET:=YES
 BRIDGE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install
