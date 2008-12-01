From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  1 Dec 2008 05:49:24 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20081201134924.2C43F3C765@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-01 05:49:23 -0800 (Mon, 01 Dec 2008)
New Revision: 24215

Log:
strace: fix lower case no to NO when setting STRACE_AUTORECONF

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/strace/strace.mk


Changeset:
Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2008-12-01 13:33:33 UTC (rev 24214)
+++ trunk/buildroot/package/strace/strace.mk	2008-12-01 13:49:23 UTC (rev 24215)
@@ -6,7 +6,7 @@
 STRACE_VERSION:=4.5.18
 STRACE_SOURCE:=strace-$(STRACE_VERSION).tar.bz2
 STRACE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/strace
-STRACE_AUTORECONF:=no
+STRACE_AUTORECONF:=NO
 STRACE_INSTALL_STAGING:=NO
 STRACE_INSTALL_TARGET:=YES
 
