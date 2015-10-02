From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Oct 2015 13:53:00 -0300
Subject: [Buildroot] [PATCH] redis: bump to version 3.0.4
Message-ID: <1443804780-13854-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
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
-- 
2.4.9
