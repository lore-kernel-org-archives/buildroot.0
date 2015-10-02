From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 21:46:03 +0200
Subject: [Buildroot] [git commit] redis: bump to version 3.0.4
Message-ID: <20151002194622.C047081D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6782aaa582997147f1eb2c6e890a39d885d3b34e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash |    2 +-
 package/redis/redis.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 9afa94f..47964e9 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,2 +1,2 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha1	0e2d7707327986ae652df717059354b358b83358 	redis-3.0.3.tar.gz
+sha1	cccc58b2b8643930840870f17280fcae57ed7675 	redis-3.0.4.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index ef51972..ea20b77 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.0.3
+REDIS_VERSION = 3.0.4
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
