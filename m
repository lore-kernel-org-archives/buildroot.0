From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 18:31:26 +0200
Subject: [Buildroot] [git commit] boot/mv-ddr-marvell: bump version to
 armada-18.12
Message-ID: <20190921164321.D7BA48EF28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=219586ec5ae58f115f5a5e868399b2e52df707d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version of Marvell DDR training software. This update accompanies
update of the ARM Trusted Firmware used on Marvell A8K platforms.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/mv-ddr-marvell/mv-ddr-marvell.hash | 2 +-
 boot/mv-ddr-marvell/mv-ddr-marvell.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.hash b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
index 90fab71d60..9324dd21c3 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.hash
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9aaea1f5e8bf3c9d7e735f569d130b5c2ec773c43e0cfabc9b8dee32adbf7e4e mv-ddr-marvell-99d772547314f84921268d57e53d8769197d3e21.tar.gz
+sha256 39dcc8baccb82cbc746d8f82ce7f673e1b1236e8aee0d09e7ab12c27eeb6ecda mv-ddr-marvell-618dadd1491eb2f7b2fd74313c04f7accddae475.tar.gz
diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.mk b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
index 8d508215f8..a4e0c0467d 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.mk
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# This is the commit for mv_ddr-armada-18.09.2
-MV_DDR_MARVELL_VERSION = 99d772547314f84921268d57e53d8769197d3e21
+# This is the commit for mv_ddr-armada-18.12.0
+MV_DDR_MARVELL_VERSION = 618dadd1491eb2f7b2fd74313c04f7accddae475
 MV_DDR_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,mv-ddr-marvell,$(MV_DDR_MARVELL_VERSION))
 MV_DDR_MARVELL_LICENSE = GPL-2.0+ or LGPL-2.1 with freertos-exception-2.0, BSD-3-Clause, Marvell Commercial
 MV_DDR_MARVELL_LICENSE_FILES = ddr3_init.c
