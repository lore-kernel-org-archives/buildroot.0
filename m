From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 14:15:03 +0200
Subject: [Buildroot] [git commit] dbus: security bump to version 1.4.26
Message-ID: <20130627122814.CFEE79B22B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67d8798c189a3ddf7cbd89e4730c0bd4dcb21d2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-2168.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus/dbus.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index cb72f1f..a855f05 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.4.24
-DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
+DBUS_VERSION = 1.4.26
+DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
