From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 22:34:17 +0200
Subject: [Buildroot] [git commit] package/redis: bump to v6.2.2
Message-ID: <20210423200726.5CCAF845D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8d13baa7b252df82c7f0c6c04d1a272aa08d733
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:
================================================================================
Redis 6.2.2 Released Mon April 19 19:00:00 IST 2021
================================================================================

Upgrade urgency: HIGH, if you're using ACL and pub/sub, CONFIG REWRITE, or
suffering from performance regression.

See https://github.com/redis/redis/blob/6.2.2/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 13c35195a6..a5d3c6b1da 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  cd222505012cce20b25682fca931ec93bd21ae92cb4abfe742cf7b76aa907520  redis-6.2.1.tar.gz
+sha256  7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535  redis-6.2.2.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 074773c3e1..3bc3436039 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.2.1
+REDIS_VERSION = 6.2.2
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
