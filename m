From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 21:39:30 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-evdev:
	bump version to 2.10.5
Message-ID: <20170201204119.2D24782037@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3d9d4711e4f5673b66598e28a10adf9cc826a41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash | 4 ++--
 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
index 389356f..bf9a2cd 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002718.html
-sha256 bbf6a03fbce1a6c0c7d874eef519fd0a854bf01b515c745d41fa551ce6490cc2  xf86-input-evdev-2.10.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002767.html
+sha256 9edaa6205baf6d2922cc4db3d8e54a7e7773b5f733b0ae90f6be7725f983b70d  xf86-input-evdev-2.10.5.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 9ec893b..4933c42 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.10.4
+XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.10.5
 XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
