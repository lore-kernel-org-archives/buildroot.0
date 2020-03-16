From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 16 Mar 2020 11:31:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to v5.0.8
Message-ID: <20200316103134.4489-1-titouan.christophe@railnova.eu>
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
index ac68e62814..ee15b75e08 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 61db74eabf6801f057fd24b590232f2f337d422280fd19486eca03be87d3a82b  redis-5.0.7.tar.gz
+sha256 f3c7eac42f433326a8d981b50dba0169fdfaf46abb23fcda2f933a7552ee4ed7  redis-5.0.8.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index b85de1dfed..d3954d87ca 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.7
+REDIS_VERSION = 5.0.8
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.24.1
