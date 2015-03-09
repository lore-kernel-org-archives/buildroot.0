From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Mar 2015 22:26:23 +0100
Subject: [Buildroot] [PATCH v1 1/2] libevdev: bump version to 1.4
Message-ID: <1425936384-31801-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] for details.

[1] http://lists.freedesktop.org/archives/input-tools/2015-March/001151.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 4 ++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 83b5bdd..1708fb0 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2014-December/001132.html
-sha256 a4317de9e818093dc131cc2bb96cdfc0cebd631e4be5c5244e1e373ce1536eed libevdev-1.3.2.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2015-March/001151.html
+sha256 3223378a5c2b4fea51a1601b0404700a6ddc1e2150eb9d5f62f001ffe21dfa06 libevdev-1.4.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 56247be..52b2ac3 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.3.2
+LIBEVDEV_VERSION = 1.4
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev/
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.1.4
