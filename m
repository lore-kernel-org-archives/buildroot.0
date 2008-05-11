From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 May 2008 23:44:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/input-tools
Message-ID: <20080511064420.95CFC3C83C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-10 23:44:20 -0700 (Sat, 10 May 2008)
New Revision: 21966

Log:
Bump joystick version

Modified:
   trunk/buildroot/package/input-tools/input-tools.mk


Changeset:
Modified: trunk/buildroot/package/input-tools/input-tools.mk
===================================================================
--- trunk/buildroot/package/input-tools/input-tools.mk	2008-05-11 06:43:50 UTC (rev 21965)
+++ trunk/buildroot/package/input-tools/input-tools.mk	2008-05-11 06:44:20 UTC (rev 21966)
@@ -6,7 +6,7 @@
 
 INPUT_TOOLS_VERSION:=20051019
 INPUT_TOOLS_SOURCE:=joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
-INPUT_TOOLS_PATCH:=joystick_$(INPUT_TOOLS_VERSION)-1.1.diff.gz
+INPUT_TOOLS_PATCH:=joystick_$(INPUT_TOOLS_VERSION)-2.diff.gz
 INPUT_TOOLS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick/
 INPUT_TOOLS_DIR:=$(BUILD_DIR)/joystick-$(INPUT_TOOLS_VERSION).orig
 INPUT_TOOLS_CAT:=$(ZCAT)
