From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 21 Jun 2021 07:26:30 +0200
Subject: [Buildroot] [PATCH 1/2] package/ell: bump version to 0.41
Message-ID: <20210621052631.134719-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Needed for bluez5_utils bump to version 5.59.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 5f1cc7ddcb..2ff8889506 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08  ell-0.39.tar.xz
+sha256  4e8dba6c53cf152dbd0fd1dc3d4c7b04abf79e20a948895f85943e586870505c  ell-0.41.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index bd291c60db..ec31e68088 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.39
+ELL_VERSION = 0.41
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.30.2
