From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 23:30:29 +0000 (UTC)
Subject: [Buildroot] svn commit: [25622] trunk/buildroot/package/fontconfig
Message-ID: <20090311233029.7B90C7645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 23:30:29 +0000 (Wed, 11 Mar 2009)
New Revision: 25622

Log:
fontconfig: fix typo added in r25611

Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2009-03-11 22:15:59 UTC (rev 25621)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2009-03-11 23:30:29 UTC (rev 25622)
@@ -15,7 +15,7 @@
 
 FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
-		--with-cache-dir=/var/cache/fontconfig
+		--with-cache-dir=/var/cache/fontconfig \
 		--with-expat="$(STAGING_DIR)/usr/lib" \
 		--with-expat-lib=$(STAGING_DIR)/usr/lib \
 		--with-expat-includes=$(STAGING_DIR)/usr/include \
