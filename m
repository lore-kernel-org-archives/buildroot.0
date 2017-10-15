From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 15:51:52 +0200
Subject: [Buildroot] [git commit] package/zstd: bump version to 1.3.2
Message-ID: <20171015134432.A433E80648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53d9c465154c2d6470732f7c36157b6709d8b796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zstd/zstd.hash | 2 +-
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 7fa5f7b..5bcdde9 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 312fb9dc75668addbc9c8f33c7fa198b0fc965c576386b8451397e06256eadc6 zstd-v1.3.1.tar.gz
+sha256 ac5054a3c64e6510bc1ae890d05e3d271cc33ceebc9d06ac9f08105766d2798a zstd-v1.3.2.tar.gz
 
 # License files (locally computed as well)
 sha256 2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e836a81..089d654 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = v1.3.1
+ZSTD_VERSION = v1.3.2
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
 ZSTD_LICENSE = BSD-3-Clause, GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
