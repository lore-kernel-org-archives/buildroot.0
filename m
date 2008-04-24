From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 07:26:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsamixergui
Message-ID: <20080424142648.BE1F03C8DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 07:26:48 -0700 (Thu, 24 Apr 2008)
New Revision: 21844

Log:
remove arch specific mistake

Modified:
   trunk/buildroot/package/alsamixergui/alsamixergui.mk


Changeset:
Modified: trunk/buildroot/package/alsamixergui/alsamixergui.mk
===================================================================
--- trunk/buildroot/package/alsamixergui/alsamixergui.mk	2008-04-24 14:25:09 UTC (rev 21843)
+++ trunk/buildroot/package/alsamixergui/alsamixergui.mk	2008-04-24 14:26:48 UTC (rev 21844)
@@ -10,7 +10,7 @@
 ALSAMIXERGUI_INSTALL_STAGING = NO
 ALSAMIXERGUI_INSTALL_TARGET = YES
 
-ALSAMIXERGUI_CONF_OPT = LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/avr32-linux-uclibc/lib -lstdc++ -lX11"
+ALSAMIXERGUI_CONF_OPT = LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -lstdc++ -lX11"
 
 ALSAMIXERGUI_DEPENDENCIES = uclibc fltk
 
