From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 09:16:12 +0200
Subject: [Buildroot] [git commit] dbus: update legal info
Message-ID: <20160705071811.C15DC81D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cbb78389a5454c7754d92acce38c72425c29244
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Library and some tools (dbus-lanuch, dbus-run-session) are dual
licensed under GPLv2 or AFLv2.1 and others (dbus-monitor, dbus-send,
dbus-cleanup-sockets, dbus-uuidgen) are licensed under GPLv2+
only.

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
