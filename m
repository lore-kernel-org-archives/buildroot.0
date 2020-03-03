From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue,  3 Mar 2020 11:11:33 -0800
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to v12.16.1
Message-ID: <20200303191133.10404-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Tested on Debian 9 and Ubuntu 18.04

Fixes:
http://autobuild.buildroot.net/results/9d3545a76c4f5c06debf319687498d662a53fafb
http://autobuild.buildroot.net/results/4da6c695b8ceca0a6eee2481a1b873a46676d0f5

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 8a56c04713..992040d391 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.16.0/SHASUMS256.txt
-sha256  b8c90637473fce4444a0b4fdae2c1560a1cf9f5959fdf9670541fc52868cf925  node-v12.16.0.tar.xz
+# From https://nodejs.org/dist/v12.16.1/SHASUMS256.txt
+sha256  0a95845ba02c46102b5671d0c5732460073f2d397488337e18d1fc30146d412d  node-v12.16.1.tar.xz
 
 # Hash for license file
 sha256  3f5749f7a58edaadd77843057a90063a18067f472d8b26c0a76905cafa1063e3  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 0de3495df9..7f875058b3 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.16.0
+NODEJS_VERSION = 12.16.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.21.1 (Apple Git-122.3)
