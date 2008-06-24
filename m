From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Jun 2008 01:36:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20080624083638.4B71C3C647@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-24 01:36:37 -0700 (Tue, 24 Jun 2008)
New Revision: 22486

Log:
samba: use generic samba.org location over http

Based on patch by Thiago A. Correa.


Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2008-06-24 00:50:07 UTC (rev 22485)
+++ trunk/buildroot/package/samba/samba.mk	2008-06-24 08:36:37 UTC (rev 22486)
@@ -5,7 +5,7 @@
 #############################################################
 SAMBA_VERSION:=3.0.28a
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
-SAMBA_SITE:=ftp://us4.samba.org/pub/samba/
+SAMBA_SITE:=http://samba.org/samba/ftp/stable/
 SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VERSION)/source
 SAMBA_CAT:=$(ZCAT)
 SAMBA_BINARY:=bin/smbd
