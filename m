From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Oct 2015 12:01:23 +0200
Subject: [Buildroot] [git commit] redis: bump to version 3.0.5
Message-ID: <20151016111136.71FDD81F97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cf76dcf3f9aaefc449c3a09798ffc6a61449c4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash |    4 +++-
 package/redis/redis.mk   |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 47964e9..d8a957d 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,2 +1,4 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha1	cccc58b2b8643930840870f17280fcae57ed7675 	redis-3.0.4.tar.gz
+sha1	ad3ee178c42bfcfd310c72bbddffbbe35db9b4a6 	redis-3.0.5.tar.gz
+# Calculated based on the hash above
+sha256	4c176826eee909fbdc63db1c15adc22aab42d758043829e556f4331e6a5bd480	redis-3.0.5.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index ea20b77..e7f4299 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.0.4
+REDIS_VERSION = 3.0.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
