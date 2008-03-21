From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri, 21 Mar 2008 10:57:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltrace
Message-ID: <20080321175742.D89BB3C342@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-21 10:57:42 -0700 (Fri, 21 Mar 2008)
New Revision: 21442

Log:
Ltrace version changed, cannot find the old version on any debian mirrors. Patch by Nigel Kukard.

Modified:
   trunk/buildroot/package/ltrace/ltrace.mk


Changeset:
Modified: trunk/buildroot/package/ltrace/ltrace.mk
===================================================================
--- trunk/buildroot/package/ltrace/ltrace.mk	2008-03-21 17:57:02 UTC (rev 21441)
+++ trunk/buildroot/package/ltrace/ltrace.mk	2008-03-21 17:57:42 UTC (rev 21442)
@@ -5,7 +5,7 @@
 #############################################################
 LTRACE_VERSION=0.5
 LTRACE_SOURCE=ltrace_$(LTRACE_VERSION).orig.tar.gz
-LTRACE_PATCH=ltrace_$(LTRACE_VERSION)-3.diff.gz
+LTRACE_PATCH=ltrace_$(LTRACE_VERSION)-3.1.diff.gz
 LTRACE_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/ltrace
 LTRACE_DIR=$(BUILD_DIR)/ltrace-$(LTRACE_VERSION)
 LTRACE_BINARY=ltrace
