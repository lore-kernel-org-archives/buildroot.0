From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Wed, 12 Dec 2018 08:33:49 +0800
Subject: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.16.0
Message-ID: <1544574829-21380-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wayland/wayland.hash | 10 +++++-----
 package/wayland/wayland.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 4fa83a4..3f28460 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2018-April/037767.html
-md5  b7393c17fdce9a8d383edab656c92fd2  wayland-1.15.0.tar.xz
-sha1 374e07b4f3b7fdfa7c4206cdd48224ea00d69d68  wayland-1.15.0.tar.xz
-sha256 eb3fbebb8559d56a80ad3753ec3db800f587329067962dbf65e14488b4b7aeb0  wayland-1.15.0.tar.xz
-sha512 f908917f1b575d2dc4d9770d3303e2637e8744fcb5c81feb2af2fe82cc51f54e22beaddfbe775fcf9623584169b7a062c75076132abeb888717180bfab53b3a8  wayland-1.15.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2018-August/039358.html
+md5  0c215e53de71d6fb26f7102cdc6432d3  wayland-1.16.0.tar.xz
+sha1 24c63a5045c653dcfa24efd10fa7c7de89aca9ef  wayland-1.16.0.tar.xz
+sha256 4e72c2b56109ccfb6610d776e465f4ca0af2280c9c2f7d5cc23f0ed2548752f5  wayland-1.16.0.tar.xz
+sha512 64eca2b1c0bc7913508a5499dae87e2723c712d8024acbb4c77c3c4a6c20de78c10704ae9827fd034116ca540a547aeec28c5a1e3bd382b23f85231424b0f49c  wayland-1.16.0.tar.xz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 827924e..6c2997b 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.15.0
+WAYLAND_VERSION = 1.16.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
2.7.4
