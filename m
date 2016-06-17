From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 18 Jun 2016 00:13:24 +0200
Subject: [Buildroot] [PATCH v1] libevdev: bump version to 1.5.2
Message-ID: <1466201604-25254-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/input-tools/2016-June/001307.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 4 ++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index a4fcd9b..a2074f8 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from https://lists.freedesktop.org/archives/input-tools/2016-May/001301.html
-sha256 17630821a57e6e3f02e01ade836f24068df9bd530067091152b0d468c3a86f40 libevdev-1.5.1.tar.xz
+# Hash from https://lists.freedesktop.org/archives/input-tools/2016-June/001307.html
+sha256 5ee2163656a61f5703cb5c08a05c9471ffb7b640bfbe2c55194ea50d908f629b libevdev-1.5.2.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index b0832d8..3f2bbd4 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.5.1
+LIBEVDEV_VERSION = 1.5.2
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.8.1
