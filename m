From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sat,  3 Feb 2007 13:05:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/flex
Message-ID: <20070203210554.3444448634@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-02-03 13:05:53 -0800 (Sat, 03 Feb 2007)
New Revision: 17744

Log:
new patch version


Modified:
   trunk/buildroot/package/flex/flex.mk


Changeset:
Modified: trunk/buildroot/package/flex/flex.mk
===================================================================
--- trunk/buildroot/package/flex/flex.mk	2007-02-03 20:52:33 UTC (rev 17743)
+++ trunk/buildroot/package/flex/flex.mk	2007-02-03 21:05:53 UTC (rev 17744)
@@ -4,7 +4,7 @@
 #
 #############################################################
 FLEX_VERSION:=2.5.33
-FLEX_PATCH_VERSION:=10
+FLEX_PATCH_VERSION:=11
 FLEX_SOURCE:=flex_$(FLEX_VERSION).orig.tar.gz
 FLEX_PATCH:=flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
 FLEX_SITE:=http://ftp.debian.org/debian/pool/main/f/flex
