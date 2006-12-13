From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 05:13:03 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dhcp
Message-ID: <20061213131303.734D74856F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 05:13:02 -0800 (Wed, 13 Dec 2006)
New Revision: 16896

Log:
bump version


Modified:
   trunk/buildroot/package/dhcp/dhcp.mk


Changeset:
Modified: trunk/buildroot/package/dhcp/dhcp.mk
===================================================================
--- trunk/buildroot/package/dhcp/dhcp.mk	2006-12-13 13:09:41 UTC (rev 16895)
+++ trunk/buildroot/package/dhcp/dhcp.mk	2006-12-13 13:13:02 UTC (rev 16896)
@@ -3,7 +3,7 @@
 # dhcp
 #
 #############################################################
-DHCP_VER:=3.0.4
+DHCP_VER:=3.0.5
 DHCP_SOURCE:=dhcp-$(DHCP_VER).tar.gz
 DHCP_SITE:=ftp://ftp.isc.org/isc/dhcp
 DHCP_CAT:=$(ZCAT)
