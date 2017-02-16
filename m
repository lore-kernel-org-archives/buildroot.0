From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Feb 2017 21:18:52 +0100
Subject: [Buildroot] [git commit] f2fs-tools: bump to version 1.8.0
Message-ID: <20170301170421.9AF077FB5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6440a5f72f610aadf3320a04143531a95b2db563
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/f2fs-tools/f2fs-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index d3956c4..ac8bd39 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = v1.6.1
+F2FS_TOOLS_VERSION = v1.8.0
 F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 F2FS_TOOLS_SITE_METHOD = git
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
