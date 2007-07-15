From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 15 Jul 2007 10:06:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/acpid
Message-ID: <20070715170617.68D4AA685F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-15 10:06:15 -0700 (Sun, 15 Jul 2007)
New Revision: 19096

Log:
Fix acpid version info

Modified:
   trunk/buildroot/package/acpid/acpid.mk


Changeset:
Modified: trunk/buildroot/package/acpid/acpid.mk
===================================================================
--- trunk/buildroot/package/acpid/acpid.mk	2007-07-15 12:39:08 UTC (rev 19095)
+++ trunk/buildroot/package/acpid/acpid.mk	2007-07-15 17:06:15 UTC (rev 19096)
@@ -3,9 +3,9 @@
 # acpid
 #
 #############################################################
-ACPID_VERSION:=1.0.4-1
+ACPID_VERSION:=1.0.4
 ACPID_DIR=$(BUILD_DIR)/acpid-$(ACPID_VERSION)
-ACPID_SOURCE=acpid_$(ACPID_VERSION).tar.gz
+ACPID_SOURCE=acpid_$(ACPID_VERSION)-1.tar.gz
 ACPID_SITE=http://ftp.debian.org/debian/pool/main/a/acpid
 
 $(DL_DIR)/$(ACPID_SOURCE):
