From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 13 Jan 2009 18:44:33 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/acpid
Message-ID: <20090113184433.1A71B76C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-13 18:44:32 +0000 (Tue, 13 Jan 2009)
New Revision: 24821

Log:
Bump acpid version and update source filename

Modified:
   trunk/buildroot/package/acpid/acpid.mk


Changeset:
Modified: trunk/buildroot/package/acpid/acpid.mk
===================================================================
--- trunk/buildroot/package/acpid/acpid.mk	2009-01-13 18:43:46 UTC (rev 24820)
+++ trunk/buildroot/package/acpid/acpid.mk	2009-01-13 18:44:32 UTC (rev 24821)
@@ -3,9 +3,9 @@
 # acpid
 #
 #############################################################
-ACPID_VERSION:=1.0.4
+ACPID_VERSION:=1.0.8
 ACPID_DIR=$(BUILD_DIR)/acpid-$(ACPID_VERSION)
-ACPID_SOURCE=acpid_$(ACPID_VERSION)-1.tar.gz
+ACPID_SOURCE=acpid_$(ACPID_VERSION).orig.tar.gz
 ACPID_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
 
 $(DL_DIR)/$(ACPID_SOURCE):
