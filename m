From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 May 2017 15:27:54 +0200
Subject: [Buildroot] [git commit branch/next] redis: bump version to 3.2.9
Message-ID: <20170519132814.D1E757F8CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34761b2c409cf4bfd8be46e2e531adeafb39b742
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove sha1 hash. Upstream provides now a sha256 hash.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 4 +---
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 3cd8647..2eef91c 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,4 +1,2 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha1 6780d1abb66f33a97aad0edbe020403d0a15b67f  redis-3.2.8.tar.gz
-# Calculated based on the hash above
-sha256 61b373c23d18e6cc752a69d5ab7f676c6216dc2853e46750a8c4ed791d68482c  redis-3.2.8.tar.gz
+sha256 6eaacfa983b287e440d0839ead20c2231749d5d6b78bbe0e0ffa3a890c59ff26  redis-3.2.9.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 3f4956c..67e9e7e 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.2.8
+REDIS_VERSION = 3.2.9
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
