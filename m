From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Aug 2016 12:23:25 -0300
Subject: [Buildroot] [PATCH] libinput: bump to version 1.4.2
Message-ID: <1472570605-12273-1-git-send-email-gustavo@zacarias.com.ar>
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
index a1a7ca2..0cdcc38 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-August/030348.html
-sha256	26e7b3ab499358caba499705680ea7e5851af2bd37dc32f2be64181610d6392a	libinput-1.4.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-August/030857.html
+sha256	8c38826a785594811bef6a9daadbfa2e172e3f070f8863393d6fb7ca4c68e451	libinput-1.4.2.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 5ce51c2..eb74e34 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.4.1
+LIBINPUT_VERSION = 1.4.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.7.3
