From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Dec 2016 12:00:49 -0300
Subject: [Buildroot] [PATCH] libinput: bump to version 1.5.3
Message-ID: <1481295649-1368-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index ea7bdf7..0345c13 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-November/031926.html
-sha256	ba26e2bc64ed551eaef193178ed06b07b97a09ac6f4e442f5f15bbc3f3174682	libinput-1.5.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-December/032110.html
+sha256	91206c523b4e7aeecf296d0b94276c61bea90b9260d198c8ee3a91eced10a6e3	libinput-1.5.3.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 765a3cb..b079305 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.5.2
+LIBINPUT_VERSION = 1.5.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.7.3
