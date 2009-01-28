From: laird at uclibc.org <laird@uclibc.org>
Date: Wed, 28 Jan 2009 15:35:41 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/autoconf
Message-ID: <20090128153542.0132D769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-28 15:35:39 +0000 (Wed, 28 Jan 2009)
New Revision: 25102

Log:
autoconf.mk: Bounce version to 2.63

Have been having various issues with multiple jobs (-jX) and building
autoconf.  Turns out that v2.63 has fixed this.  So bounce version
to a working version.
 
Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>


Modified:
   trunk/buildroot/package/autoconf/autoconf.mk


Changeset:
Modified: trunk/buildroot/package/autoconf/autoconf.mk
===================================================================
--- trunk/buildroot/package/autoconf/autoconf.mk	2009-01-28 15:33:08 UTC (rev 25101)
+++ trunk/buildroot/package/autoconf/autoconf.mk	2009-01-28 15:35:39 UTC (rev 25102)
@@ -3,7 +3,7 @@
 # autoconf
 #
 #############################################################
-AUTOCONF_VERSION:=2.61
+AUTOCONF_VERSION:=2.63
 AUTOCONF_SOURCE:=autoconf-$(AUTOCONF_VERSION).tar.bz2
 AUTOCONF_SITE:=$(BR2_GNU_MIRROR)/autoconf
 AUTOCONF_CAT:=$(BZCAT)
