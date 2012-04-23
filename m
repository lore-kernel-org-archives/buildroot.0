From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 23 Apr 2012 08:55:55 +0200
Subject: [Buildroot] [PATCH v2 2/2] dbus: bump to 1.4.20
In-Reply-To: <1335164155-20004-1-git-send-email-yegorslists@googlemail.com>
References: <1335164155-20004-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1335164155-20004-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
v2: remove commented DBUS_SOURCE line

 package/dbus/dbus.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 0942b33..7e72e3d 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,8 +3,7 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.4.16
-DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
+DBUS_VERSION = 1.4.20
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_INSTALL_STAGING = YES
 
-- 
1.7.7
