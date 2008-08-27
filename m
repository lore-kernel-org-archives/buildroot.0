From: laird at uclibc.org <laird@uclibc.org>
Date: Wed, 27 Aug 2008 05:32:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gtkperf
Message-ID: <20080827123222.EDA633C7DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-27 05:32:22 -0700 (Wed, 27 Aug 2008)
New Revision: 23242

Log:
gtkperf: Remove settings that are default

Remove default setting of AUTORECONF = no



Modified:
   trunk/buildroot/package/gtkperf/gtkperf.mk


Changeset:
Modified: trunk/buildroot/package/gtkperf/gtkperf.mk
===================================================================
--- trunk/buildroot/package/gtkperf/gtkperf.mk	2008-08-27 12:21:09 UTC (rev 23241)
+++ trunk/buildroot/package/gtkperf/gtkperf.mk	2008-08-27 12:32:22 UTC (rev 23242)
@@ -6,7 +6,6 @@
 GTKPERF_VERSION:=0.40
 GTKPERF_SOURCE:=gtkperf_$(GTKPERF_VERSION).tar.gz
 GTKPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gtkperf
-GTKPERF_AUTORECONF = NO
 GTKPERF_INSTALL_TARGET = YES
 GTKPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 GTKPERF_DEPENDENCIES = libgtk2
