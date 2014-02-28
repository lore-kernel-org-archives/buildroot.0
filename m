From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Feb 2014 13:34:11 -0000
Subject: [Buildroot] [git commit] f2fs-tools: bump to version 1.3.0
Message-ID: <20140228133410.279B59BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00e71ee64408c6c226f458e80d6e444e94009814
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version includes:
 - add f2fstat tool
 - critical bug fix on nat bitmaps

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/f2fs-tools/f2fs-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
