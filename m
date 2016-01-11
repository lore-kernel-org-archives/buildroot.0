From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 11 Jan 2016 23:53:41 +0100
Subject: [Buildroot] [PATCH v1] libevdev: bump version to 1.4.6
Message-ID: <1452552821-4221-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update version and hash (see [1] for details).

[1] http://lists.freedesktop.org/archives/input-tools/2016-January/001240.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 4 ++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index af78c0f..20ca4fb 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2015-November/001227.html
-sha256 e91c58ca86e0631186798449e0a78c65474ff562081d968ba0521f76c8c2ca1d libevdev-1.4.5.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2016-January/001240.html
+sha256 7b2ae1a0c7f9f7a96198ddc8fd167f090f233d6cbd8168b847e4f968445132d3 libevdev-1.4.6.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index b126943..5513191 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.4.5
+LIBEVDEV_VERSION = 1.4.6
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.1.4
