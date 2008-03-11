From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 12:13:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20080311191340.0D1EA120135@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 12:13:38 -0700 (Tue, 11 Mar 2008)
New Revision: 21306

Log:
updated samba version

Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2008-03-11 18:54:17 UTC (rev 21305)
+++ trunk/buildroot/package/samba/samba.mk	2008-03-11 19:13:38 UTC (rev 21306)
@@ -3,7 +3,7 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION:=3.0.28
+SAMBA_VERSION:=3.0.28a
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
 SAMBA_SITE:=ftp://us4.samba.org/pub/samba/
 SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VERSION)/source
