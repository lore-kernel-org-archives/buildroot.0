From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Mon, 10 Mar 2008 07:52:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu
Message-ID: <20080310145241.B906812C734@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-10 07:52:39 -0700 (Mon, 10 Mar 2008)
New Revision: 21280

Log:
changed icu download location

Modified:
   trunk/buildroot/package/icu/icu.mk


Changeset:
Modified: trunk/buildroot/package/icu/icu.mk
===================================================================
--- trunk/buildroot/package/icu/icu.mk	2008-03-09 07:30:43 UTC (rev 21279)
+++ trunk/buildroot/package/icu/icu.mk	2008-03-10 14:52:39 UTC (rev 21280)
@@ -5,9 +5,8 @@
 #############################################################
 
 ICU_VERSION:=4c-3_8_1
-ICU_VERSION_NUM:=3.8.1
 ICU_SOURCE:=icu$(ICU_VERSION)-src.tgz
-ICU_SITE:=http://download.icu-project.org/files/icu4c/$(ICU_VERSION_NUM)
+ICU_SITE:=http://superb-west.dl.sourceforge.net/sourceforge/icu
 ICU_CAT:=$(ZCAT)
 ICU_DIR:=$(BUILD_DIR)/icu/source
 ICU_HOST_DIR:=$(BUILD_DIR)/icu-host/source
