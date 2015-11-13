From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 13 Nov 2015 22:09:28 +0100
Subject: [Buildroot] [PATCH v1] libevdev: bump version to 1.4.5
Message-ID: <1447448968-22829-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog (see [1] for details):

  Only a small fix, the suggested hwdb entry that the touchpad-edge-detector
  printed used the wrong codes for ABS_X and ABS_Y. Fixed with this release,
  the output is now suitable for copy/paste into the udev hwdb.

[1] http://lists.freedesktop.org/archives/input-tools/2015-November/001227.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 4 ++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 1e44bf8..af78c0f 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2015-August/001210.html
-sha256 ed9979369b6a6e28f5897d099538549ecffb2b7c00c1b717eb77c31d85bc45a9 libevdev-1.4.4.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2015-November/001227.html
+sha256 e91c58ca86e0631186798449e0a78c65474ff562081d968ba0521f76c8c2ca1d libevdev-1.4.5.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 97d8a92..b126943 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.4.4
+LIBEVDEV_VERSION = 1.4.5
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.1.4
