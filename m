From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Mar 2014 22:03:27 +0100
Subject: [Buildroot] [git commit] dbus: bump version
Message-ID: <20140326210349.59B4D9C3B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa477eb4a5d4a9cf37a2c99863d0db6d2d52fe17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index e8b3da7..4bcc953 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.6.8
+DBUS_VERSION = 1.6.18
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
