From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  3 Jul 2014 17:56:48 +0300
Subject: [Buildroot] [PATCH] dbus: security bump to version 1.8.6
Message-ID: <aefb1bf605de265d9a814352986c060c7d87b5d6.1404399408.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: CVE-2014-3532, CVE-2014-3533.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dbus/dbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 0c8fcf3e37a2..429c9230c045 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.8.4
+DBUS_VERSION = 1.8.6
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
-- 
2.0.0
