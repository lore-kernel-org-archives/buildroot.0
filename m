From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 12:45:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20070821194518.0DA2BA6038@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 12:45:17 -0700 (Tue, 21 Aug 2007)
New Revision: 19630

Log:
- add question for Ulf


Modified:
   trunk/buildroot/toolchain/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2007-08-21 19:35:08 UTC (rev 19629)
+++ trunk/buildroot/toolchain/Makefile.in	2007-08-21 19:45:17 UTC (rev 19630)
@@ -46,6 +46,7 @@
 CFLAGS_COMBINE = $(call cc-option,--combine,)
 
 # define values for prepatched source trees for toolchains
+#XXX: ulf, what about moving this to project/* ? (BF)
 VENDOR_SITE:=$(strip $(subst ",,$(BR2_VENDOR_SITE)))
 #"))
 VENDOR_SUFFIX:=$(strip $(subst ",,$(BR2_VENDOR_SUFFIX)))
