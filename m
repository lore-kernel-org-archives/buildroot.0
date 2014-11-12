From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 12 Nov 2014 21:50:11 +0100
Subject: [Buildroot] [PATCH 1/4] libevdev: bump version to 1.3
Message-ID: <1415825414-18756-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] for details.

[1] http://lists.freedesktop.org/archives/input-tools/2014-September/001112.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index fde7d3c..d34307f 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.2.2
+LIBEVDEV_VERSION = 1.3
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev/
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
1.8.1.4
