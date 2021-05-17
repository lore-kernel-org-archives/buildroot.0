From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Mon, 17 May 2021 15:05:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v6.2.3
Message-ID: <20210517130539.157605-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the release notes:
================================================================================
Redis 6.2.3 Released Mon May 3 19:00:00 IST 2021
================================================================================

Upgrade urgency: SECURITY, Contains fixes to security issues that affect
authenticated client connections. LOW otherwise.

Read more on https://github.com/redis/redis/blob/6.2.3/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index a5d3c6b1da..06e6884d85 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535  redis-6.2.2.tar.gz
+sha256  98ed7d532b5e9671f5df0825bb71f0f37483a16546364049384c63db8764512b  redis-6.2.3.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 3bc3436039..cea2d3b237 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.2.2
+REDIS_VERSION = 6.2.3
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.25.3
