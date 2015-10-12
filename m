From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 12 Oct 2015 21:21:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/dbus: remove empty line from dbus.mk
Message-ID: <1444677663-28725-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dbus/dbus.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index abce1fb..84fbdfa 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -18,7 +18,6 @@ define DBUS_USERS
 	dbus -1 dbus -1 * /var/run/dbus - dbus DBus messagebus user
 endef
 
-
 DBUS_DEPENDENCIES = host-pkgconf expat
 
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
-- 
2.6.1
