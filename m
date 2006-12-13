From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 04:34:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20061213123439.E2B864857D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 04:34:39 -0800 (Wed, 13 Dec 2006)
New Revision: 16891

Log:
another typo


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2006-12-13 12:34:22 UTC (rev 16890)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2006-12-13 12:34:39 UTC (rev 16891)
@@ -9,7 +9,8 @@
 VERSION:=2
 PATCHLEVEL:=6
 SUBLEVEL:=19
-EXTRAVERSION:=1
+EXTRAVERSION:=.1
+LOCALVERSION:=
 LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
