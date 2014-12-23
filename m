From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 11:35:24 +0100
Subject: [Buildroot] [git commit] f2fs-tools: bump to version 1.4.0
Message-ID: <20141223103529.40C9A8072F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02b1975b787fa01c1115eca34adf309ac0830ada
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/f2fs-tools/f2fs-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 2045e05..2035506 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = 858c4039c85f7c00c57925902985701b1e083555
+F2FS_TOOLS_VERSION = baac4b4e6f41ceb02511da49dd3707674f3fea21
 F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 F2FS_TOOLS_SITE_METHOD = git
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
