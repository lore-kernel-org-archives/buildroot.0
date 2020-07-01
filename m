From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 30 Jun 2020 22:36:05 -0600
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to version 6.0.5
Message-ID: <20200701043605.3842956-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index cf13bb9c0a..97e8d451e6 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256  3337005a1e0c3aa293c87c313467ea8ac11984921fab08807998ba765c9943de  redis-6.0.4.tar.gz
+sha256  42cf86a114d2a451b898fcda96acd4d01062a7dbaaad2801d9164a36f898f596  redis-6.0.5.tar.gz
 
 # Locally calculated
 sha256  cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 262f6cd1f4..192e6fa9f8 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.4
+REDIS_VERSION = 6.0.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.25.1
