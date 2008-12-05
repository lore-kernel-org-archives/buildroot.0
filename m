From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  5 Dec 2008 07:27:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libiconv
Message-ID: <20081205152736.4C63E3C8DC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-05 07:27:35 -0800 (Fri, 05 Dec 2008)
New Revision: 24286

Log:
libiconv: use BR2_GNU_MIRROR

Modified:
   trunk/buildroot/package/libiconv/libiconv.mk


Changeset:
Modified: trunk/buildroot/package/libiconv/libiconv.mk
===================================================================
--- trunk/buildroot/package/libiconv/libiconv.mk	2008-12-05 15:27:33 UTC (rev 24285)
+++ trunk/buildroot/package/libiconv/libiconv.mk	2008-12-05 15:27:35 UTC (rev 24286)
@@ -5,7 +5,7 @@
 #############################################################
 LIBICONV_VERSION = 1.12
 LIBICONV_SOURCE = libiconv-$(LIBICONV_VERSION).tar.gz
-LIBICONV_SITE = http://ftp.gnu.org/pub/gnu/libiconv
+LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_AUTORECONF = NO
 LIBICONV_INSTALL_STAGING = YES
 LIBICONV_INSTALL_TARGET = YES
