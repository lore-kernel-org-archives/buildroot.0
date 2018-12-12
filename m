From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Wed, 12 Dec 2018 08:37:28 +0800
Subject: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump to version
 1.17
Message-ID: <1544575048-21624-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wayland-protocols/wayland-protocols.hash | 8 ++++----
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 9cbb4fe..d62a433 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2018-February/036992.html
-md5 29312149dafcd4a0e739ba94995a574d  wayland-protocols-1.13.tar.xz
-sha1 1b4b3385e168c361b4d350668d92f3a90ceee189  wayland-protocols-1.13.tar.xz
-sha256 0758bc8008d5332f431b2a84fea7de64d971ce270ed208206a098ff2ebc68f38  wayland-protocols-1.13.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2018-November/039662.html
+md5 55ddd5fdb02b73b9de9559aaec267315  wayland-protocols-1.17.tar.xz
+sha1 7d2569c838c776545e3eb1b1049b9c37178aae24  wayland-protocols-1.17.tar.xz
+sha256 df1319cf9705643aea9fd16f9056f4e5b2471bd10c0cc3713d4a4cdc23d6812f  wayland-protocols-1.17.tar.xz
 sha256 f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index bba0979..5ed4c3b 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.13
+WAYLAND_PROTOCOLS_VERSION = 1.17
 WAYLAND_PROTOCOLS_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.7.4
