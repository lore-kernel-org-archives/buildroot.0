From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  3 Mar 2020 16:16:53 -0700
Subject: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump to version
 1.20
Message-ID: <20200303231653.17149-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wayland-protocols/wayland-protocols.hash | 10 +++++-----
 package/wayland-protocols/wayland-protocols.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index a27ff9e52c..321fc62de5 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-July/040756.html
-md5 af38f22d8e233c2f2e00ddc8dcc94694  wayland-protocols-1.18.tar.xz
-sha1 aa2f132c082f3c790bd046283b3ef7ce3fb11370  wayland-protocols-1.18.tar.xz
-sha256 3d73b7e7661763dc09d7d9107678400101ecff2b5b1e531674abfa81e04874b3  wayland-protocols-1.18.tar.xz
-sha256 f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-February/041269.html
+md5  b0836533a3f2dc6585b1dae00341157f  wayland-protocols-1.20.tar.xz
+sha1  e78c739a3a85477ed524b81e8bb75efe7f8bf4df  wayland-protocols-1.20.tar.xz
+sha256  9782b7a1a863d82d7c92478497d13c758f52e7da4f197aa16443f73de77e4de7  wayland-protocols-1.20.tar.xz
+sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index fbfa99558d..ed60d1c995 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.18
+WAYLAND_PROTOCOLS_VERSION = 1.20
 WAYLAND_PROTOCOLS_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.20.1
