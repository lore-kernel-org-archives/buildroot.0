From: Axel Lin <axel.lin@ingics.com>
Date: Sun, 09 Feb 2014 10:48:52 +0800
Subject: [Buildroot] [PATCH] f2fs-tools: bump to version 1.3.0
Message-ID: <1391914132.17493.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version includes:
 - add f2fstat tool
 - critical bug fix on nat bitmaps

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/f2fs-tools/f2fs-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index cffd4cb..2045e05 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = 576cb469e73b9342f1d10ba5d0428bbce22cbc3b
+F2FS_TOOLS_VERSION = 858c4039c85f7c00c57925902985701b1e083555
 F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 F2FS_TOOLS_SITE_METHOD = git
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
-- 
1.8.1.2
