From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Feb 2017 12:34:58 +0100
Subject: [Buildroot] [git commit] redis: security bump to version 3.2.7
Message-ID: <20170201113636.F06E1820FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbc042b91ef118cf2fc42b6b5558161c752ce6e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
  https://www.reddit.com/r/redis/comments/5r8wxn/redis_327_is_out_important_security_fixes_inside/

From the notes:
Upgrade urgency HIGH.

This release fixes important security and correctness issues.  It is
especially important to upgrade for Redis Cluster users and for users
running Redis in their laptop since a cross-scripting attack is fixed in
this release.

[Peter: extend description]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 4 ++--
 package/redis/redis.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index b6e8eac..d4ac7c3 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,4 +1,4 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha1	0c7bc5c751bdbc6fabed178db9cdbdd948915d1b 	redis-3.2.6.tar.gz
+sha1 6889af053020cd72ebb16805ead0ce9b3a69a9ef  redis-3.2.7.tar.gz
 # Calculated based on the hash above
-sha256	2e1831c5a315e400d72bda4beaa98c0cfbe3f4eb8b20c269371634390cf729fa	redis-3.2.6.tar.gz
+sha256 bf9df3e5374bfe7bfc3386380f9df13d94990011504ef07632b3609bb2836fa9  redis-3.2.7.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 0b07d18..63964b5 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.2.6
+REDIS_VERSION = 3.2.7
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
