From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Mon, 10 Mar 2008 08:15:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu
Message-ID: <20080310151558.2F2CF12011A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-10 08:15:57 -0700 (Mon, 10 Mar 2008)
New Revision: 21281

Log:
changed to use sourceforge variable

Modified:
   trunk/buildroot/package/icu/icu.mk


Changeset:
Modified: trunk/buildroot/package/icu/icu.mk
===================================================================
--- trunk/buildroot/package/icu/icu.mk	2008-03-10 14:52:39 UTC (rev 21280)
+++ trunk/buildroot/package/icu/icu.mk	2008-03-10 15:15:57 UTC (rev 21281)
@@ -6,7 +6,7 @@
 
 ICU_VERSION:=4c-3_8_1
 ICU_SOURCE:=icu$(ICU_VERSION)-src.tgz
-ICU_SITE:=http://superb-west.dl.sourceforge.net/sourceforge/icu
+ICU_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/icu
 ICU_CAT:=$(ZCAT)
 ICU_DIR:=$(BUILD_DIR)/icu/source
 ICU_HOST_DIR:=$(BUILD_DIR)/icu-host/source
