From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:46:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20080306184637.1C8301201A5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:46:36 -0800 (Thu, 06 Mar 2008)
New Revision: 21249

Log:
fixed dbus makefile

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2008-03-06 18:40:08 UTC (rev 21248)
+++ trunk/buildroot/package/dbus/dbus.mk	2008-03-06 18:46:36 UTC (rev 21249)
@@ -16,7 +16,7 @@
 DBUS_XML_DEP:=expat
 else
 DBUS_XML:=libxml
-DBUS_XML_DEP:=libxml2-headers
+DBUS_XML_DEP:=libxml2
 endif
 
 $(DL_DIR)/$(DBUS_SOURCE):
