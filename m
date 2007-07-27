From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 27 Jul 2007 00:29:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20070727072923.4FE6CA4630@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-27 00:29:22 -0700 (Fri, 27 Jul 2007)
New Revision: 19265

Log:
Remove bad definition of LD to allow building of shared libraries

Modified:
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2007-07-26 11:12:51 UTC (rev 19264)
+++ trunk/buildroot/package/gettext/gettext.mk	2007-07-27 07:29:22 UTC (rev 19265)
@@ -90,7 +90,6 @@
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no \
 		gl_cv_c_restrict=no \
-		LD=$(TARGET_CROSS)gcc \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
