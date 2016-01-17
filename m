From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jan 2016 15:55:15 +0100
Subject: [Buildroot] [PATCH 3/5] package/x11r7/xdriver_xf86-input-evdev:
	bump version to 2.10.1
In-Reply-To: <1453042517-12040-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453042517-12040-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453042517-12040-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash | 4 ++--
 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
index cd892d3..3314934 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-October/002649.html
-sha256	d097298eb07b7a9edf4493b5c3c058041458ca52c8c62dbd4f40b84c5086d117	xf86-input-evdev-2.10.0.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2016-January/002669.html
+sha256	af9c2b47f5b272ae56b45da6bd84610fc9a3d80a4b32c8215842a39d862de017	xf86-input-evdev-2.10.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 6f692ab..4a2ed36 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.10.0
+XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.10.1
 XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
-- 
2.7.0.rc3
