From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 18 Nov 2019 16:22:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to 5.0.6
Message-ID: <20191118152216.42274-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 391b227ed1..aca1109d30 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 2139009799d21d8ff94fc40b7f36ac46699b9e1254086299f8d3b223ca54a375  redis-5.0.5.tar.gz
+sha256 6624841267e142c5d5d5be292d705f8fb6070677687c5aad1645421a936d22b3  redis-5.0.6.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a321eb9347..4ed90a749e 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.5
+REDIS_VERSION = 5.0.6
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.21.0
