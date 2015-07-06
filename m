From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  6 Jul 2015 20:45:56 +0200
Subject: [Buildroot] [PATCH v1] libevdev: bump version to 1.4.3
Message-ID: <1436208356-28462-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From [1]:
- tools: widen frequency resolution to ?s in the DPI tool
- tools: complain about devices that don't have abs x/y axes in the edge detector
- include: update to 4.1 header

[1] http://lists.freedesktop.org/archives/input-tools/2015-June/001171.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 4 ++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 535490b..1b7897d 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2015-April/001167.html
-sha256 7c77b213f075706d428a2af54b66bf86b03a68e9fb390e7ec48cf55065970643 libevdev-1.4.2.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2015-June/001171.html
+sha256 1c418b26fd78b0e9900872be2f77fb5311c877b34ec5c75efd1b670ed627969b libevdev-1.4.3.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 3ed7ba0..082a7cc 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.4.2
+LIBEVDEV_VERSION = 1.4.3
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.1.4
