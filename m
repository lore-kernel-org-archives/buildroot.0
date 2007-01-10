From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 10 Jan 2007 10:39:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/autoconf
Message-ID: <20070110183947.A06074856D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-10 10:39:47 -0800 (Wed, 10 Jan 2007)
New Revision: 17228

Log:
- bump version


Modified:
   trunk/buildroot/package/autoconf/autoconf.mk


Changeset:
Modified: trunk/buildroot/package/autoconf/autoconf.mk
===================================================================
--- trunk/buildroot/package/autoconf/autoconf.mk	2007-01-10 18:39:08 UTC (rev 17227)
+++ trunk/buildroot/package/autoconf/autoconf.mk	2007-01-10 18:39:47 UTC (rev 17228)
@@ -3,7 +3,7 @@
 # autoconf
 #
 #############################################################
-AUTOCONF_VER:=2.60
+AUTOCONF_VER:=2.61
 AUTOCONF_SOURCE:=autoconf-$(AUTOCONF_VER).tar.bz2
 AUTOCONF_SITE:=http://ftp.gnu.org/pub/gnu/autoconf
 AUTOCONF_CAT:=$(BZCAT)
