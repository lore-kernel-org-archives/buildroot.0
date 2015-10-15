From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 16 Oct 2015 00:16:10 +0200
Subject: [Buildroot] [PATCH] systemd: bump to 227
Message-ID: <1444947370-7878-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added back the hash as it was discussed during the last Buildroot Dev
Days.

Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/systemd.hash | 2 ++
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/systemd/systemd.hash

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
new file mode 100644
index 0000000..60aebcf
--- /dev/null
+++ b/package/systemd/systemd.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 6766e8489e359f3d608a9f032eb1f52d7c55d76d0f9171837cf2b3284b2b904b  systemd-227.tar.gz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2e974fa..414dc0d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 226
+SYSTEMD_VERSION = 227
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
-- 
2.6.1
