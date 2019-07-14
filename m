From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 13:04:30 +0200
Subject: [Buildroot] [PATCH] package/redis: bump version to 5.0.5
Message-ID: <20190714110431.27244-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the release notes:
https://raw.githubusercontent.com/antirez/redis/5.0/00-RELEASENOTES

================================================================================
Redis 5.0.5     Released Wed May 15 17:57:41 CEST 2019
================================================================================

Upgrade urgency CRITICAL: This release fixes an important AOF fysnc bug
                          and other less critical issues.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 9ec243d7dd..391b227ed1 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 3ce9ceff5a23f60913e1573f6dfcd4aa53b42d4a2789e28fa53ec2bd28c987dd  redis-5.0.4.tar.gz
+sha256 2139009799d21d8ff94fc40b7f36ac46699b9e1254086299f8d3b223ca54a375  redis-5.0.5.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 372676438a..a321eb9347 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.4
+REDIS_VERSION = 5.0.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.11.0
