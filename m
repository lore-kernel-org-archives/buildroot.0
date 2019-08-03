From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:45:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/zstd: bump version to 1.4.2
Message-ID: <20190803194528.21954-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zstd/zstd.hash | 2 +-
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 75780d5132..0f79628ecc 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 d6e1559e4cdb7c4226767d4ddc990bff5f9aab77085ff0d0490c828b025e2eea zstd-1.3.5.tar.gz
+sha256 7a6e1dad34054b35e2e847eb3289be8820a5d378228802239852f913c6dcf6a7 zstd-1.4.2.tar.gz
 
 # License files (locally computed as well)
 sha256 2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 9e79990dec..687440f271 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.3.5
+ZSTD_VERSION = 1.4.2
 ZSTD_SITE = $(call github,facebook,zstd,v$(ZSTD_VERSION))
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
-- 
2.20.1
