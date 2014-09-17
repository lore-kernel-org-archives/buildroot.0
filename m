From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 09:18:39 -0300
Subject: [Buildroot] [PATCH] dbus: security bump to version 1.8.8
Message-ID: <1410956319-29075-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-3635 - Buffer access with incorrect length value
CVE-2014-3636 - Allocation of file descriptors or handles
without limits or throttling
CVE-2014-3637 - Missing release of file descriptor or handle after
effective lifetime
CVE-2014-3638 - Algorithmic complexity
CVE-2014-3639 - Allocation of file descriptors or handles without
limits or throttling

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus/dbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 63cec6e..3f29a30 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.8.6
+DBUS_VERSION = 1.8.8
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
-- 
1.8.5.5
