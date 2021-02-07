From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:30:03 +0100
Subject: [Buildroot] [git commit] package/redis: add REDIS_CPE_ID_VENDOR
Message-ID: <20210207091616.0C75D8122F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59e890df274bb77f28a3c3a0272e73937fccc041
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:redislabs:redis is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aredislabs%3Aredis

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 0a6f7045c3..96132ae962 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -8,6 +8,7 @@ REDIS_VERSION = 6.0.10
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
+REDIS_CPE_ID_VENDOR = redislabs
 
 define REDIS_USERS
 	redis -1 redis -1 * /var/lib/redis /bin/false - Redis Server
