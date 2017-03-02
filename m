From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  2 Mar 2017 12:26:29 -0300
Subject: [Buildroot] [PATCH 1/2] wayland: bump to version 1.13.0
Message-ID: <20170302152630.28568-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wayland/wayland.hash | 4 ++--
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 9a58c56..9b2c01d 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-September/031121.html
-sha256  d6b4135cba0188abcb7275513c72dede751d6194f6edc5b82183a3ba8b821ab1	wayland-1.12.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-February/033193.html
+sha256  69b052c031a61e89af7cc8780893d0da1e301492352aa449dee9345043e6fe51	wayland-1.13.0.tar.xz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index a862394..286871e 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.12.0
+WAYLAND_VERSION = 1.13.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
2.10.2
