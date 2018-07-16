From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 16:14:13 +0200
Subject: [Buildroot] [git commit] package/minetest: bump to version 4.17.1
Message-ID: <20180716141921.38ABA8868E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf2f764b3ffe1a1988342c0c53d3f2841f482bcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minetest/minetest.hash | 2 +-
 package/minetest/minetest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
index 5e6aeffa43..e8b8bf2fce 100644
--- a/package/minetest/minetest.hash
+++ b/package/minetest/minetest.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 0ef3793de9f569746ea78af7a66fe96ef65400019e5e64a04a5c3fa26a707655  minetest-0.4.16.tar.gz
+sha256 cd25d40c53f492325edabd2f6397250f40a61cb9fe4a1d4dd6eb030e0d1ceb59  minetest-0.4.17.1.tar.gz
 
 sha256 e48121374512b8f2fada00ac1c8e100a767e2a2edd2853557ccf1995e35a4be0  README.txt
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index a813a0db4e..8b573a0f4f 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_VERSION = 0.4.16
+MINETEST_VERSION = 0.4.17.1
 MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
 MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
 MINETEST_LICENSE_FILES = README.txt
