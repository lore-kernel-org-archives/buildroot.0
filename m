From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jan 2017 10:48:37 -0300
Subject: [Buildroot] [PATCH] libinput: bump to version 1.5.4
Message-ID: <20170116134837.15107-1-gustavo@zacarias.com.ar>
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
index 0345c13..73f5c01 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-December/032110.html
-sha256	91206c523b4e7aeecf296d0b94276c61bea90b9260d198c8ee3a91eced10a6e3	libinput-1.5.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-January/032610.html
+sha256	6f9ad1ede468bd54ec4469b8a4eb93a6f62f7fe6480c7a43e36c5d58cc2822b7	libinput-1.5.4.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index b079305..f4ae0fc 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.5.3
+LIBINPUT_VERSION = 1.5.4
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.10.2
