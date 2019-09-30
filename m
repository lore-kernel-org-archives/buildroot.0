From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:06:33 +0200
Subject: [Buildroot] [git commit] package/zstd: bump version to 1.4.3
Message-ID: <20190930210314.4A28883CCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74b2cea3b624b47e709bf243abd97794cbfa10a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zstd/zstd.hash | 2 +-
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 0f79628ecc..8a69261314 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 7a6e1dad34054b35e2e847eb3289be8820a5d378228802239852f913c6dcf6a7 zstd-1.4.2.tar.gz
+sha256 5eda3502ecc285c3c92ee0cc8cd002234dee39d539b3f692997a0e80de1d33de zstd-1.4.3.tar.gz
 
 # License files (locally computed as well)
 sha256 2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 687440f271..765fa6dd56 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.4.2
+ZSTD_VERSION = 1.4.3
 ZSTD_SITE = $(call github,facebook,zstd,v$(ZSTD_VERSION))
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
