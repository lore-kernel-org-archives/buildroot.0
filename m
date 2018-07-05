From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  6 Jul 2018 00:11:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/minetest: bump to version 4.17.1
Message-ID: <20180705221108.6684-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.14.4
