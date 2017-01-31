From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 31 Jan 2017 16:19:04 +0000
Subject: [Buildroot] [PATCH] redis: bump version to 3.2.7
Message-ID: <20170131161904.28657-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/redis/redis.hash | 4 ++--
 package/redis/redis.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index b6e8eac..d4ac7c3 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,4 +1,4 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha1	0c7bc5c751bdbc6fabed178db9cdbdd948915d1b 	redis-3.2.6.tar.gz
+sha1 6889af053020cd72ebb16805ead0ce9b3a69a9ef  redis-3.2.7.tar.gz
 # Calculated based on the hash above
-sha256	2e1831c5a315e400d72bda4beaa98c0cfbe3f4eb8b20c269371634390cf729fa	redis-3.2.6.tar.gz
+sha256 bf9df3e5374bfe7bfc3386380f9df13d94990011504ef07632b3609bb2836fa9  redis-3.2.7.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 0b07d18..63964b5 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.2.6
+REDIS_VERSION = 3.2.7
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.10.2
