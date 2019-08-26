From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Aug 2019 18:47:41 -0600
Subject: [Buildroot] [PATCH/next v4 2/3] package/wayland-protocols: bump to
 version 1.18
In-Reply-To: <20190826004742.81132-1-james.hilliard1@gmail.com>
References: <20190826004742.81132-1-james.hilliard1@gmail.com>
Message-ID: <20190826004742.81132-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wayland-protocols/wayland-protocols.hash | 8 ++++----
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index d62a433dfd..a27ff9e52c 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2018-November/039662.html
-md5 55ddd5fdb02b73b9de9559aaec267315  wayland-protocols-1.17.tar.xz
-sha1 7d2569c838c776545e3eb1b1049b9c37178aae24  wayland-protocols-1.17.tar.xz
-sha256 df1319cf9705643aea9fd16f9056f4e5b2471bd10c0cc3713d4a4cdc23d6812f  wayland-protocols-1.17.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-July/040756.html
+md5 af38f22d8e233c2f2e00ddc8dcc94694  wayland-protocols-1.18.tar.xz
+sha1 aa2f132c082f3c790bd046283b3ef7ce3fb11370  wayland-protocols-1.18.tar.xz
+sha256 3d73b7e7661763dc09d7d9107678400101ecff2b5b1e531674abfa81e04874b3  wayland-protocols-1.18.tar.xz
 sha256 f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 5ed4c3bc90..fbfa99558d 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.17
+WAYLAND_PROTOCOLS_VERSION = 1.18
 WAYLAND_PROTOCOLS_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.20.1
