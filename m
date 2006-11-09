From: Pavel Roskin <proski@gnu.org>
Date: Wed, 08 Nov 2006 19:07:57 -0500
Subject: [Buildroot] [PATCH] Update hdparm version
Message-ID: <1163030877.27162.19.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

hdparm-6.5.tar.gz is no longer present on ibiblio.org.  Current version
of hdparm is 6.7.  Update hdparm version to 6.7.

Index: package/hdparm/hdparm.mk
===================================================================
--- package/hdparm/hdparm.mk	(revision 16521)
+++ package/hdparm/hdparm.mk	(working copy)
@@ -3,10 +3,10 @@
 # hdparm
 #
 #############################################################
-HDPARM_SOURCE:=hdparm-6.5.tar.gz
+HDPARM_SOURCE:=hdparm-6.7.tar.gz
 HDPARM_SITE:=http://www.ibiblio.org/pub/Linux/system/hardware/
 HDPARM_CAT:=$(ZCAT)
-HDPARM_DIR:=$(BUILD_DIR)/hdparm-6.5
+HDPARM_DIR:=$(BUILD_DIR)/hdparm-6.7
 HDPARM_BINARY:=hdparm
 HDPARM_TARGET_BINARY:=sbin/hdparm
 



-- 
Regards,
Pavel Roskin
