From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 28 Mar 2018 20:13:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump version to
 1.13
Message-ID: <20180328181350.25188-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wayland-protocols/wayland-protocols.hash | 8 ++++----
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index d1d643caa7..9cbb4fef72 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-December/036037.html
-md5 ac83c4704003323b6bd5a1b91fb1be53  wayland-protocols-1.12.tar.xz
-sha1 ac908e91c6c5e7802c0af48f55725ad683017e72  wayland-protocols-1.12.tar.xz
-sha256 3b19e8a9e1e19474756a7069db23b90ca9b8ebb438448c6063b4a7fc89b7c8b2  wayland-protocols-1.12.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2018-February/036992.html
+md5 29312149dafcd4a0e739ba94995a574d  wayland-protocols-1.13.tar.xz
+sha1 1b4b3385e168c361b4d350668d92f3a90ceee189  wayland-protocols-1.13.tar.xz
+sha256 0758bc8008d5332f431b2a84fea7de64d971ce270ed208206a098ff2ebc68f38  wayland-protocols-1.13.tar.xz
 sha256 f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 0d23e9af32..bba0979934 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.12
+WAYLAND_PROTOCOLS_VERSION = 1.13
 WAYLAND_PROTOCOLS_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.14.2
