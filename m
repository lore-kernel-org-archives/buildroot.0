From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon,  2 Oct 2006 11:25:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20061002182538.5DCC548562@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-10-02 11:25:37 -0700 (Mon, 02 Oct 2006)
New Revision: 16288

Log:
Andrew E. Mileski writes:
This looks like a typo to me.  Without this patch, one ends up with
"i386AArchitecture" being defined, which doesn't match anything.


Modified:
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2006-10-01 21:37:40 UTC (rev 16287)
+++ trunk/buildroot/package/xorg/xorg.mk	2006-10-02 18:25:37 UTC (rev 16288)
@@ -59,7 +59,7 @@
 XARCH=Arm32
 endif
 ifeq ($(BR2_i386),y)
-XARCH=i386A
+XARCH=i386
 endif
 ifeq ($(BR2_mips),y)
 XARCH=Mips
