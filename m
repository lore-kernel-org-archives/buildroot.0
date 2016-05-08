From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 15:34:52 +0200
Subject: [Buildroot] [git commit] fs/common: fix typo in comments
Message-ID: <20160508133522.4CAD3802A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2dcb2d6c4144688e2b9ec4d744af306276120f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed comment typos as to improve clarity.

Signed-off-by: Brian 'redbeard' Harrington <redbeard@coreos.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
