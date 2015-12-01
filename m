From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2015 23:21:17 -0000
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-evdev:
	bump version to 2.10.0
Message-ID: <20151201232117.470B07FA3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a458f926bb6afce2791ffb5e76595c7e4834126d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash | 4 ++--
 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
index 330ac30..cd892d3 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-March/002557.html
-sha256	792329b531afc6928ccda94e4b51a5520d4ddf8ef9a00890a5d0d31898acefec	xf86-input-evdev-2.9.2.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-October/002649.html
+sha256	d097298eb07b7a9edf4493b5c3c058041458ca52c8c62dbd4f40b84c5086d117	xf86-input-evdev-2.10.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 6019412..1e90afa 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.9.2
+XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.10.0
 XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
