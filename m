From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  6 Sep 2016 22:14:14 +0200
Subject: [Buildroot] [PATCH v1] libevdev: bump version to 1.5.4
Message-ID: <1473192854-19663-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1] and [2].

[1] https://lists.freedesktop.org/archives/input-tools/2016-August/001324.html
[2] https://lists.freedesktop.org/archives/input-tools/2016-August/001327.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 4 ++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index a2074f8..a2a5cd8 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from https://lists.freedesktop.org/archives/input-tools/2016-June/001307.html
-sha256 5ee2163656a61f5703cb5c08a05c9471ffb7b640bfbe2c55194ea50d908f629b libevdev-1.5.2.tar.xz
+# Hash from https://lists.freedesktop.org/archives/input-tools/2016-August/001327.html
+sha256 11fe76d62cc76fbc9dbf8e94696a80eee63780139161e5cf54c55ec21a8173a4 libevdev-1.5.4.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 3f2bbd4..ef660c7 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.5.2
+LIBEVDEV_VERSION = 1.5.4
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.8.1
