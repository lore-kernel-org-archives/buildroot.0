From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 06:14:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsamixergui
Message-ID: <20080424131426.5FAF93C824@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 06:14:25 -0700 (Thu, 24 Apr 2008)
New Revision: 21831

Log:
small fix for alsamixergui

Modified:
   trunk/buildroot/package/alsamixergui/alsamixergui.mk


Changeset:
Modified: trunk/buildroot/package/alsamixergui/alsamixergui.mk
===================================================================
--- trunk/buildroot/package/alsamixergui/alsamixergui.mk	2008-04-24 11:22:06 UTC (rev 21830)
+++ trunk/buildroot/package/alsamixergui/alsamixergui.mk	2008-04-24 13:14:25 UTC (rev 21831)
@@ -10,7 +10,7 @@
 ALSAMIXERGUI_INSTALL_STAGING = NO
 ALSAMIXERGUI_INSTALL_TARGET = YES
 
-ALSAMIXERGUI_CONF_OPT = LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/avr32-linux-uclibc/lib -lstdc++"
+ALSAMIXERGUI_CONF_OPT = LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/avr32-linux-uclibc/lib -lstdc++ -lX11"
 
 ALSAMIXERGUI_DEPENDENCIES = uclibc fltk
 
