From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 06:25:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sylpheed
Message-ID: <20080424132503.4A0603C84C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 06:25:02 -0700 (Thu, 24 Apr 2008)
New Revision: 21839

Log:
remove arch-prefix from binary filename

Modified:
   trunk/buildroot/package/sylpheed/sylpheed.mk


Changeset:
Modified: trunk/buildroot/package/sylpheed/sylpheed.mk
===================================================================
--- trunk/buildroot/package/sylpheed/sylpheed.mk	2008-04-24 13:23:28 UTC (rev 21838)
+++ trunk/buildroot/package/sylpheed/sylpheed.mk	2008-04-24 13:25:02 UTC (rev 21839)
@@ -12,7 +12,7 @@
 SYLPHEED_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 SYLPHEED_CONF_ENV = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
-SYLPHEED_CONF_OPT = --disable-gtkspell
+SYLPHEED_CONF_OPT = --disable-gtkspell --program-prefix=""
 
 SYLPHEED_DEPENDENCIES = uclibc 
 
