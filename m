From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 11 Sep 2006 11:12:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2
Message-ID: <20060911181213.E510448610@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-09-11 11:12:13 -0700 (Mon, 11 Sep 2006)
New Revision: 16103

Log:
- add missing include


Modified:
   trunk/buildroot/toolchain/gcc/4.2/205-uclibc-locale-update.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/4.2/205-uclibc-locale-update.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/205-uclibc-locale-update.patch	2006-09-11 17:42:44 UTC (rev 16102)
+++ trunk/buildroot/toolchain/gcc/4.2/205-uclibc-locale-update.patch	2006-09-11 18:12:13 UTC (rev 16103)
@@ -95,7 +95,7 @@
 +#ifdef HAVE_LIBINTL_H
  #include <libintl.h> 		// For messages
  #endif
- 
+ #include <cstdarg>
  #ifdef __UCLIBC_MJN3_ONLY__
  #warning what is _GLIBCXX_C_LOCALE_GNU for
 +// psm: used in os/gnu-linux/ctype_noninline.h
