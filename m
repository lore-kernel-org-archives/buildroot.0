From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 09 Oct 2013 16:47:05 +0800
Subject: [Buildroot] [PATCH] redis: bump to version 2.6.16
Message-ID: <1381308425.20719.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Redis project home page moved to redis.io, thus also update the download
url accordingly.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/redis/redis.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 8b4e900..6974a35 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-REDIS_VERSION = 2.6.11
-REDIS_SITE = http://redis.googlecode.com/files
+REDIS_VERSION = 2.6.16
+REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
 
-- 
1.8.1.2
