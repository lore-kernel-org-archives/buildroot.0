From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 25 May 2021 19:14:27 +0200
Subject: [Buildroot] [PATCH 1/5] package/zstd: bump to version 1.5.0
Message-ID: <20210525171432.819180-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/zstd/zstd.hash | 4 ++--
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index a979501e5f..2d7bf37b2a 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
-# From https://github.com/facebook/zstd/releases/download/v1.4.9/zstd-1.4.9.tar.gz.sha256
-sha256  29ac74e19ea28659017361976240c4b5c5c24db3b89338731a6feb97c038d293  zstd-1.4.9.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz.sha256
+sha256  5194fbfa781fcf45b98c5e849651aa7b3b0a008c6b72d4a0db760f3002291e94  zstd-1.5.0.tar.gz
 
 # License files (locally computed)
 sha256  2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b  LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index d741ddba2a..d4b1362820 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.4.9
+ZSTD_VERSION = 1.5.0
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
-- 
2.30.2
