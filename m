From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Oct 2017 13:22:53 +0200
Subject: [Buildroot] [git commit] package/nodejs: bump version to 8.8.1
Message-ID: <20171026111655.C9C4081190@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07e4910c56746336d35ae8ed7183c36b3675fc0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a regression introduced in 8.8.0.
See https://nodejs.org/en/blog/release/v8.8.1/

Peter: apply on top of 8.8.0, mention that it fixes regression]
Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 30497ea..9367c54 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From http://nodejs.org/dist/v8.8.0/SHASUMS256.txt
-sha256 854f32d27cd62895a13a6af43b87e0542f512f40af960244d15cf16da0914ecf  node-v8.8.0.tar.xz
+# From http://nodejs.org/dist/v8.8.1/SHASUMS256.txt
+sha256 5ce2c47ab779992db49942f757a01cc5131db5cef4e0dd270e48151b0887b57a  node-v8.8.1.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 8c30cb9..a29f572 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.8.0
+NODEJS_VERSION = 8.8.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
