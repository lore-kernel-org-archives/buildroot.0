From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 09:28:31 +0200
Subject: [Buildroot] [git commit] boot/mv-ddr-marvell: bump version to
 armada-18.09.2
Message-ID: <20181011072918.A72CC813F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5a39424e5626f6cd8d9dd9c81df72fd4559fdf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is necessary to be able to bump the ARM Trusted Firmware version
used on Marvell platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/mv-ddr-marvell/mv-ddr-marvell.hash | 2 +-
 boot/mv-ddr-marvell/mv-ddr-marvell.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.hash b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
index b96d4d2bc8..90fab71d60 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.hash
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d413546367ffa3b5f4373a777b9efeb32dcc74d6106897c248935ecb79afc454 mv-ddr-marvell-656440a9690f3d07be9e3d2c39d7cf56fd96eb7b.tar.gz
+sha256 9aaea1f5e8bf3c9d7e735f569d130b5c2ec773c43e0cfabc9b8dee32adbf7e4e mv-ddr-marvell-99d772547314f84921268d57e53d8769197d3e21.tar.gz
diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.mk b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
index 0f98fc2cef..8d508215f8 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.mk
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-MV_DDR_MARVELL_VERSION = 656440a9690f3d07be9e3d2c39d7cf56fd96eb7b
+# This is the commit for mv_ddr-armada-18.09.2
+MV_DDR_MARVELL_VERSION = 99d772547314f84921268d57e53d8769197d3e21
 MV_DDR_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,mv-ddr-marvell,$(MV_DDR_MARVELL_VERSION))
 MV_DDR_MARVELL_LICENSE = GPL-2.0+ or LGPL-2.1 with freertos-exception-2.0, BSD-3-Clause, Marvell Commercial
 MV_DDR_MARVELL_LICENSE_FILES = ddr3_init.c
