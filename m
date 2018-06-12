From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 22:21:53 +0200
Subject: [Buildroot] [git commit] f2fs-tools: bump to version 1.10.0
Message-ID: <20180612202315.830A98844E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e3ff45cf1287c0ef9f890cad06008dad0efaafc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/f2fs-tools/f2fs-tools.hash | 3 ++-
 package/f2fs-tools/f2fs-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
index 36c3b115c6..cef779084c 100644
--- a/package/f2fs-tools/f2fs-tools.hash
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 aefd2a67e8ddf9db92145dde41b4a697d1c498ff2e113fbfd26ce1efa6cc3f2d  f2fs-tools-v1.8.0.tar.gz
+sha256 424ea9fd2472ea062f21c4268a82a7ad435b6f704e41a494424068c11dec4c24  f2fs-tools-v1.10.0.tar.gz
+sha256 662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 9b827df086..333a2cf7d4 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = v1.8.0
+F2FS_TOOLS_VERSION = v1.10.0
 F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 F2FS_TOOLS_SITE_METHOD = git
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
