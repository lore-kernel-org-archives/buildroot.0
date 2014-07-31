From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 22:46:32 +0200
Subject: [Buildroot] [PATCH 1/2] libevdev: bump to 1.2.2
Message-ID: <1406839593-32462-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevdev/libevdev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index f4570bc..738af92 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.2.1
+LIBEVDEV_VERSION = 1.2.2
 LIBEVDEV_SITE = http://cgit.freedesktop.org/libevdev/snapshot
 LIBEVDEV_LICENSE = X11
 LIBEVDEV_LICENSE_FILES = COPYING
-- 
2.0.0
