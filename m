From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 4 Jul 2016 18:16:23 +0530
Subject: [Buildroot] [PATCH 3/6] dbus: update legal info
In-Reply-To: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1467636386-6759-3-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Library and some tools (dbus-lanuch, dbus-run-session) are dual
licensed under GPLv2 or AFLv2.1 and others (dbus-monitor, dbus-send,
dbus-cleanup-sockets, dbus-uuidgen) are licensed under GPLv2+
only.

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/dbus/dbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index fbdceb3..11c3d4e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,7 @@
 
 DBUS_VERSION = 1.10.8
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
-DBUS_LICENSE = AFLv2.1, GPLv2+
+DBUS_LICENSE = AFLv2.1 or GPLv2+ (library, tools), GPLv2+ (tools)
 DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
 
-- 
2.6.2
