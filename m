From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Jun 2018 20:40:49 +0300
Subject: [Buildroot] [PATCH 2/3] f2fs-tools: bump to version 1.10.0
In-Reply-To: <e2de174cc828db7318acd88ebc64f751411e8458.1528825250.git.baruch@tkos.co.il>
References: <e2de174cc828db7318acd88ebc64f751411e8458.1528825250.git.baruch@tkos.co.il>
Message-ID: <7c62044c545e65151879b3e2fa4c4ab57eed7b80.1528825250.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/f2fs-tools/f2fs-tools.hash | 3 ++-
 package/f2fs-tools/f2fs-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
index 36c3b115c643..cef779084c22 100644
--- a/package/f2fs-tools/f2fs-tools.hash
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 aefd2a67e8ddf9db92145dde41b4a697d1c498ff2e113fbfd26ce1efa6cc3f2d  f2fs-tools-v1.8.0.tar.gz
+sha256 424ea9fd2472ea062f21c4268a82a7ad435b6f704e41a494424068c11dec4c24  f2fs-tools-v1.10.0.tar.gz
+sha256 662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 9b827df08626..333a2cf7d4ef 100644
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
-- 
2.17.1
