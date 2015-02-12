From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Feb 2015 11:24:54 +0100
Subject: [Buildroot] [git commit] dbus: security bump
Message-ID: <20150212102705.8597A80E35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b173fd795036b61abf09b2f324347a94ba41ed2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2015-0245. See announcement for details:

http://lists.freedesktop.org/archives/dbus/2015-February/016554.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash |    4 ++--
 package/dbus/dbus.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 2079929..19113a6 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	83425250a6a4c93b9ab4a349771a7700e8ddff2d73a5a088222ca47ae9ce1f1a  dbus-1.8.14.tar.gz
+# Locally calculated after checking pgp signature
+sha256	7f795268efd343ff0498786acb35097564390d40b1b6158daf1b4f742b522b07  dbus-1.8.16.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index faad2b5..200084f 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.8.14
+DBUS_VERSION = 1.8.16
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
