From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:59:32 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-evdev:
	bump version to 2.10.1
Message-ID: <20160119205943.93038802FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f502aac711751c87e560777f6968352519ac13e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
