From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 21:19:24 +0100
Subject: [Buildroot] [git commit] package/libbluray: bump version to 0.9.2
Message-ID: <20160313204834.A93E68185E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d019af4bd9dbefe5992932fd65e1df201eb2c812
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index 5bb41a1..9acd89d 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,2 +1,2 @@
-# From http://get.videolan.org/libbluray/0.8.1/libbluray-0.8.1.tar.bz2.sha512
-sha512	6618e01a567f0dc5d21302fc771d4155589c81703028b76f6090a2d12ef1c7e9d08d9c79312a7c8b2ca0d6c63ce980195f0866509a4f8f05f64ed6650c7f78dc	libbluray-0.8.1.tar.bz2
+# From http://get.videolan.org/libbluray/0.9.2/libbluray-0.9.2.tar.bz2.sha512
+sha512	f7fda2ef4c0ec70eb9a38aed0e76d21d8784410cb13713e7ee66ecd23a1cc58325977b046d40c526554a4a4e4cf96706a233e15451bf34892aff201b47e25aef	libbluray-0.9.2.tar.bz2
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index e62ad48..2cc27f1 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 0.8.1
+LIBBLURAY_VERSION = 0.9.2
 LIBBLURAY_SITE = http://get.videolan.org/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
