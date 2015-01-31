From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Jan 2015 13:26:33 +0100
Subject: [Buildroot] [git commit] package/nodejs: bump to version 0.10.36
Message-ID: <20150131132552.3CECF80474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bd712bb8284b966055645c529e7a92be218985a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to new version and update hash.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash |    4 ++--
 package/nodejs/nodejs.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index a6f2698..5b868e9 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.35/SHASUMS256.txt
-sha256	0043656bb1724cb09dbdc960a2fd6ee37d3badb2f9c75562b2d11235daa40a03  node-v0.10.35.tar.gz
+# From upstream URL: http://nodejs.org/dist/v0.10.36/SHASUMS256.txt
+sha256	b9d7d1d0294bce46686b13a05da6fc5b1e7743b597544aa888e8e64a9f178c81  node-v0.10.36.tar.gz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index c2cb05e..89faa6c 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 0.10.35
+NODEJS_VERSION = 0.10.36
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
