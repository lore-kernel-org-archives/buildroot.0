From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 18 Dec 2016 10:43:51 -0300
Subject: [Buildroot] [PATCH] redis: bump to version 3.2.6
Message-ID: <20161218134351.6772-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/redis/redis.hash | 4 ++--
 package/redis/redis.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 7e09db5..b6e8eac 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,4 +1,4 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha1	6f6333db6111badaa74519d743589ac4635eba7a 	redis-3.2.5.tar.gz
+sha1	0c7bc5c751bdbc6fabed178db9cdbdd948915d1b 	redis-3.2.6.tar.gz
 # Calculated based on the hash above
-sha256	8509ceb1efd849d6b2346a72a8e926b5a4f6ed3cc7c3cd8d9f36b2e9ba085315	redis-3.2.5.tar.gz
+sha256	2e1831c5a315e400d72bda4beaa98c0cfbe3f4eb8b20c269371634390cf729fa	redis-3.2.6.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 3b70991..0b07d18 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.2.5
+REDIS_VERSION = 3.2.6
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.10.2
