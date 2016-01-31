From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 16:39:37 +0100
Subject: [Buildroot] [git commit] redis: bump to version 3.0.7
Message-ID: <20160201224700.60B647F918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02681171f370953764edeaa0c645748c86a1d83d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 4 ++--
 package/redis/redis.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 4d2f3b7..07783f5 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,4 +1,4 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha1	4b1c7b1201984bca8f7f9c6c58862f6928cf0a25 	redis-3.0.6.tar.gz
+sha1	e56b4b7e033ae8dbf311f9191cf6fdf3ae974d1c 	redis-3.0.7.tar.gz
 # Calculated based on the hash above
-sha256	6f1e1523194558480c3782d84d88c2decf08a8e4b930c56d4df038e565b75624	redis-3.0.6.tar.gz
+sha256	b2a791c4ea3bb7268795c45c6321ea5abcc24457178373e6a6e3be6372737f23	redis-3.0.7.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 1edcf6e..6a3dd01 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.0.6
+REDIS_VERSION = 3.0.7
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
