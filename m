From: Brian 'redbeard' Harrington <redbeard@coreos.com>
Date: Sat, 7 May 2016 20:27:48 -0700
Subject: [Buildroot] [PATCH 1/1] fix typo in common fs Makefile definitions
Message-ID: <572EB234.3050907@coreos.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed comment typos as to improve clarity. 

Signed-off-by: Brian 'redbeard' Harrington <redbeard@coreos.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 3a424f6..46e097b 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -26,7 +26,7 @@
 # In terms of configuration option, this macro assumes that the
 # BR2_TARGET_ROOTFS_$(FSTYPE) config option allows to enable/disable
 # the generation of a filesystem image of a particular type. If
-# configura options BR2_TARGET_ROOTFS_$(FSTYPE)_GZIP,
+# the configuration options BR2_TARGET_ROOTFS_$(FSTYPE)_GZIP,
 # BR2_TARGET_ROOTFS_$(FSTYPE)_BZIP2 or
 # BR2_TARGET_ROOTFS_$(FSTYPE)_LZMA exist and are enabled, then the
 # macro will automatically generate a compressed filesystem image.
-- 
2.4.11
