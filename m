From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 07:22:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microperl
Message-ID: <20061122152258.27E184858E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 07:22:57 -0800 (Wed, 22 Nov 2006)
New Revision: 16620

Log:
- bump version


Modified:
   trunk/buildroot/package/microperl/microperl.mk


Changeset:
Modified: trunk/buildroot/package/microperl/microperl.mk
===================================================================
--- trunk/buildroot/package/microperl/microperl.mk	2006-11-22 15:22:31 UTC (rev 16619)
+++ trunk/buildroot/package/microperl/microperl.mk	2006-11-22 15:22:57 UTC (rev 16620)
@@ -3,7 +3,7 @@
 # microperl
 #
 #############################################################
-MICROPERL_VER=5.8.7
+MICROPERL_VER=5.8.8
 MICROPERL_SOURCE=perl-$(MICROPERL_VER).tar.bz2
 MICROPERL_CAT:=$(BZCAT)
 MICROPERL_SITE=ftp://ftp.cpan.org/pub/CPAN/src/5.0
