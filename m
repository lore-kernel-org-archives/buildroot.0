From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 21:36:49 +0100
Subject: [Buildroot] [git commit] redis: bump to version 3.0.6
Message-ID: <20160201224701.05D917F918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e537d52b8516a751b2bec0ce0b0139f9c3d6f16f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/redis/redis.hash | 4 ++--
 package/redis/redis.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index d8a957d..4d2f3b7 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,4 +1,4 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha1	ad3ee178c42bfcfd310c72bbddffbbe35db9b4a6 	redis-3.0.5.tar.gz
+sha1	4b1c7b1201984bca8f7f9c6c58862f6928cf0a25 	redis-3.0.6.tar.gz
 # Calculated based on the hash above
-sha256	4c176826eee909fbdc63db1c15adc22aab42d758043829e556f4331e6a5bd480	redis-3.0.5.tar.gz
+sha256	6f1e1523194558480c3782d84d88c2decf08a8e4b930c56d4df038e565b75624	redis-3.0.6.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index e7f4299..1edcf6e 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.0.5
+REDIS_VERSION = 3.0.6
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
