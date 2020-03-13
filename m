From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 17:18:21 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/nodejs: bump
 version to v12.16.1
Message-ID: <20200313160755.9237D90B43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64316feb985047c520eb4fb4e1d3ef818bbb5694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes a number of regressions introduced in v12.16.0:
https://github.com/nodejs/node/blob/master/doc/changelogs/CHANGELOG_V12.md#12.16.1

Tested on Debian 9 and Ubuntu 18.04

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 47b348114d746c10ad4bb2a099f91e1ea133d9a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
