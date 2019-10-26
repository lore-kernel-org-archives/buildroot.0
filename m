From: Grzegorz Blach <grzegorz@blach.pl>
Date: Sat, 26 Oct 2019 11:21:10 +0000
Subject: [Buildroot] [PATCH 1/1] package/f2fs-tools: bump to 1.13.0
Message-ID: <20191026112110.774941-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release includes:
 - enable VERITY by default on Android
 - introduce some preen mode in fsck.f2fs
 - add f2fs_io tool
 - add casefolding support

And, there are lots of bug fixes.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/f2fs-tools/f2fs-tools.hash | 2 +-
 package/f2fs-tools/f2fs-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
index 16fbb73f5a..4eb4d14709 100644
--- a/package/f2fs-tools/f2fs-tools.hash
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e2124e4dffaba865d41495d817bcb924d096adaec67ff777b8c7da99aa13f696  f2fs-tools-1.12.0.tar.gz
+sha256 b39d3ae9224267aab0070b5f17d91d0c5143f6d960166a27f6b11c8c87072c7d  f2fs-tools-1.13.0.tar.gz
 sha256 662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 99799641a3..a9536dc8e7 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = 1.12.0
+F2FS_TOOLS_VERSION = 1.13.0
 F2FS_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
 F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
-- 
2.23.0
