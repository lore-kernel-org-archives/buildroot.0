From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 12:13:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070801191319.5B4A8A6091@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 12:13:18 -0700 (Wed, 01 Aug 2007)
New Revision: 19392

Log:
Avoid stopping asking questions, when gettext is selected

Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-08-01 15:52:57 UTC (rev 19391)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-08-01 19:13:18 UTC (rev 19392)
@@ -148,6 +148,7 @@
 UCLIBC_HAS_SIGNUM_MESSAGES=y
 # UCLIBC_HAS_SYS_SIGLIST is not set
 UCLIBC_HAS_GNU_GETOPT=y
+# UCLIBC_HAS_GETTEXT_AWARENESS is not set
 UCLIBC_HAS_GNU_GETSUBOPT=y
 
 #
