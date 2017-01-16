From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 16 Jan 2017 22:04:33 +0100
Subject: [Buildroot] [PATCH v1] libevdev: bump version to 1.5.6
Message-ID: <20170116210433.17081-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/input-tools/2017-January/001380.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 4 ++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 1dbdfdba7..613866cfb 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from https://lists.freedesktop.org/archives/input-tools/2016-November/001375.html
-sha256 320120782018b992956b3fa29495c323832860807ac8ea74537e636a0e0280b1 libevdev-1.5.5.tar.xz
+# Hash from https://lists.freedesktop.org/archives/input-tools/2017-January/001380.html
+sha256 ecec7e9d66b1d3692f10b3b20aa97fb25e874a784c5552a7b1698091fef5a688 libevdev-1.5.6.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index fca362ff6..01ee7fbaa 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.5.5
+LIBEVDEV_VERSION = 1.5.6
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.11.0
