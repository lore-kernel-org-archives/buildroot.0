From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 21:54:46 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xbacklight: bump
 version to 1.2.2
Message-ID: <20180324210427.B83D7834AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca54ec200a1fd549043311ad5cf013e1c39bd772
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xbacklight/xapp_xbacklight.hash | 9 +++++++--
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
index 058c53fca2..b2aa760600 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-October/002331.html
-sha256	17f6cf51a35eaa918abec36b7871d28b712c169312e22a0eaf1ffe8d6468362b	xbacklight-1.2.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002862.html
+md5 d50cf135af04436b9456a5ab7dcf7971  xbacklight-1.2.2.tar.bz2
+sha1 8cc84c4b2e23e99bfa72239847af4b42ae89669e  xbacklight-1.2.2.tar.bz2
+sha256 615a1d13e429ed5a0300b2f4508bc199d7cf21b6b9f088a9d8188d3bc957bf5e  xbacklight-1.2.2.tar.bz2
+sha512 4dca70ef8e3494b19ea126c46395807cddc007b2b09a133810daeb77ae27fa36ac4eec7813828248fc195abe27f59700cfa58ee65ef3a020a51f73e5107678ec  xbacklight-1.2.2.tar.bz2
+# Locally computed
+sha256 c9fbf1f272215babef31808c1235de8e4f7641ca5edfc4fc615b6556054b2b04 COPYING
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index 88c4bc5dbe..a2907bb288 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XBACKLIGHT_VERSION = 1.2.1
+XAPP_XBACKLIGHT_VERSION = 1.2.2
 XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
 XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBACKLIGHT_LICENSE = MIT
