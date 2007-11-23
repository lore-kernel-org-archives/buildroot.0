From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Nov 2007 01:46:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20071123094643.34155A45E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-23 01:46:42 -0800 (Fri, 23 Nov 2007)
New Revision: 20490

Log:
soname changed

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-11-23 09:27:05 UTC (rev 20489)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-11-23 09:46:42 UTC (rev 20490)
@@ -70,7 +70,7 @@
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
 	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.la \
 		$(TARGET_DIR)/usr/lib/libdbus-1.so
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdbus-1.so.3.2.0
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdbus-1.so.3.3.0
 	$(MAKE) DESTDIR=$(TARGET_DIR) initddir=/etc/init.d -C $(DBUS_DIR)/bus install
 	$(INSTALL) -m 0755 package/dbus/S97messagebus $(TARGET_DIR)/etc/init.d
 	rm -f $(TARGET_DIR)/etc/init.d/messagebus
