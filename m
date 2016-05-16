From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 16 May 2016 22:06:56 +0200
Subject: [Buildroot] [PATCH v1] libevdev: bump version to 1.5.1
Message-ID: <1463429216-8541-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1] and [2].

[1] https://lists.freedesktop.org/archives/input-tools/2016-May/001296.html
[2] https://lists.freedesktop.org/archives/input-tools/2016-May/001301.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 4 ++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 20ca4fb..a4fcd9b 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2016-January/001240.html
-sha256 7b2ae1a0c7f9f7a96198ddc8fd167f090f233d6cbd8168b847e4f968445132d3 libevdev-1.4.6.tar.xz
+# Hash from https://lists.freedesktop.org/archives/input-tools/2016-May/001301.html
+sha256 17630821a57e6e3f02e01ade836f24068df9bd530067091152b0d468c3a86f40 libevdev-1.5.1.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 5513191..b0832d8 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.4.6
+LIBEVDEV_VERSION = 1.5.1
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.8.1
