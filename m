From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue,  2 Dec 2008 06:46:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20081202144638.DB8863C7B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-02 06:46:38 -0800 (Tue, 02 Dec 2008)
New Revision: 24229

Log:
samba: bump version to 3.0.33

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2008-12-02 09:15:08 UTC (rev 24228)
+++ trunk/buildroot/package/samba/samba.mk	2008-12-02 14:46:38 UTC (rev 24229)
@@ -3,7 +3,7 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION:=3.0.28a
+SAMBA_VERSION:=3.0.33
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
 SAMBA_SITE:=http://samba.org/samba/ftp/stable/
 SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VERSION)/source
