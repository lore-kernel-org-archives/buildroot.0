From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Apr 2007 08:35:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20070403153528.6A2B34807B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-04-03 08:35:26 -0700 (Tue, 03 Apr 2007)
New Revision: 18313

Log:
3.0.23d now under old-versions. Thanks to Michael Benedict

Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2007-04-03 12:09:46 UTC (rev 18312)
+++ trunk/buildroot/package/samba/samba.mk	2007-04-03 15:35:26 UTC (rev 18313)
@@ -5,7 +5,7 @@
 #############################################################
 SAMBA_VER:=3.0.23d
 SAMBA_SOURCE:=samba-$(SAMBA_VER).tar.gz
-SAMBA_SITE:=ftp://us1.samba.org/pub/samba/
+SAMBA_SITE:=ftp://us4.samba.org/pub/samba/old-versions/
 SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VER)/source
 SAMBA_CAT:=$(ZCAT)
 SAMBA_BINARY:=bin/smbd
