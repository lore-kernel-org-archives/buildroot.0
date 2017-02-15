From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Feb 2017 15:10:36 -0300
Subject: [Buildroot] [PATCH master] redis: bump to version 3.2.8
Message-ID: <20170215181036.32625-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It fixes a regression in the 3.2.7 security release that can cause server
deadlocks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/redis/redis.hash | 4 ++--
 package/redis/redis.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index d4ac7c3..3cd8647 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,4 +1,4 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha1 6889af053020cd72ebb16805ead0ce9b3a69a9ef  redis-3.2.7.tar.gz
+sha1 6780d1abb66f33a97aad0edbe020403d0a15b67f  redis-3.2.8.tar.gz
 # Calculated based on the hash above
-sha256 bf9df3e5374bfe7bfc3386380f9df13d94990011504ef07632b3609bb2836fa9  redis-3.2.7.tar.gz
+sha256 61b373c23d18e6cc752a69d5ab7f676c6216dc2853e46750a8c4ed791d68482c  redis-3.2.8.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 63964b5..8ab6e72 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.2.7
+REDIS_VERSION = 3.2.8
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.10.2
