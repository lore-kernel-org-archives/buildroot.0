From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:32:55 +0100
Subject: [Buildroot] [git commit] package/redis: bump to v6.2.1
Message-ID: <20210314221215.0A4B787748@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=774dfafdd8b81904acc2ab181916b0323d3e2a2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:
Introduction to the Redis 6.2 release
=====================================

This release is the first significant Redis release managed by the core team
under the new project governance model.

Redis 6.2 includes many new commands and improvements, but no big features. It
mainly makes Redis more complete and addresses issues that have been requested
by many users frequently or for a long time.
=====================================

See https://github.com/redis/redis/blob/6.2/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 9b87b49fb1..13c35195a6 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  f16ad973d19f80f121e53794d5eb48a997e2c6a85b5be41bb3b66750cc17bf6b  redis-6.0.12.tar.gz
+sha256  cd222505012cce20b25682fca931ec93bd21ae92cb4abfe742cf7b76aa907520  redis-6.2.1.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index c851e589c4..074773c3e1 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.12
+REDIS_VERSION = 6.2.1
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
