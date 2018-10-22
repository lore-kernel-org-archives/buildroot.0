From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 22 Oct 2018 18:06:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: Bump to version 4.0.10
Message-ID: <20181022160630.20042-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/redis/redis.hash | 3 ++-
 package/redis/redis.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index d9a14cef6c..d448228b56 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,4 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 98c4254ae1be4e452aa7884245471501c9aa657993e0318d88f048093e7f88fd  redis-3.2.12.tar.gz
+sha256 1db67435a704f8d18aec9b9637b373c34aa233d65b6e174bdac4c1b161f38ca4  redis-4.0.10.tar.gz
+
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index cbd2d7bdcb..a14ae2283f 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.2.12
+REDIS_VERSION = 4.0.10
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.18.1
