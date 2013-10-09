From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:12:23 +0200
Subject: [Buildroot] [git commit] redis: bump to version 2.6.16
Message-ID: <20131009202219.EAFF89B9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=badc3196a206282966e2104c29c2f4f698375971
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Redis project home page moved to redis.io, thus also update the download
url accordingly.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
 
