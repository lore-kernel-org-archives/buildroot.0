From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Jan 2020 19:32:42 -0700
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 12.14.1
Message-ID: <20200121023242.94475-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index bde0ac0167..92369105ff 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.14.0/SHASUMS256.txt
-sha256 088a217ba2af641b8cc15be29f6e2956b8a33e6badb85596bbc2cdea9df9be71  node-v12.14.0.tar.xz
+# From https://nodejs.org/dist/v12.14.1/SHASUMS256.txt
+sha256 877b4b842318b0e09bc754faf7343f2f097f0fc4f88ab9ae57cf9944e88e7adb  node-v12.14.1.tar.xz
 
 # Hash for license file
 sha256 950bbc741dc021489c47683e34e7637e9b96fb4a1f430b2f77a744130516e293  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 62c4c1abb1..e6eb73d576 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.14.0
+NODEJS_VERSION = 12.14.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.20.1
