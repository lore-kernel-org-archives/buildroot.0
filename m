From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  8 Sep 2020 10:27:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to version 6.0.7
Message-ID: <20200908082742.181233-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the release notes:
================================================================================
Redis 6.0.7     Released Fri Aug 28 11:05:09 IDT 2020
================================================================================

Upgrade urgency MODERATE: several bugs with moderate impact are fixed,
Specifically the first two listed below which cause protocol errors for clients.

See the full notes: https://github.com/redis/redis/blob/6.0.7/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 840019415d..8fea92e1f5 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  12ad49b163af5ef39466e8d2f7d212a58172116e5b441eebecb4e6ca22363d94  redis-6.0.6.tar.gz
+sha256  c2aaa1a4c7e72c70adedf976fdd5e1d34d395989283dab9d7840e0a304bb2393  redis-6.0.7.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 33c764a0d5..73da7b0852 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.6
+REDIS_VERSION = 6.0.7
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.25.3
