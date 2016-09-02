From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Sep 2016 14:29:37 -0000
Subject: [Buildroot] [git commit] memcached: bump to version 1.4.30
Message-ID: <20160902142936.58039822FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77a7a6b9d7854b377a6c24711b6c64a670729e15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index ab57b51..b1353b2 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.29.tar.gz.sha1
-sha1	8994b4d0dbcc8d536f3d6cd4763489a3c51ca44b	memcached-1.4.29.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.30.tar.gz.sha1
+sha1	bb8644a4110932e331d1539f0435bc6a0e558827	memcached-1.4.30.tar.gz
 # Calculated based on the hash above
-sha256	c61a3a7f9c82e574559797bbf4bb01ad8b79e436ca80b8e46f5b51ae39b03d0b	memcached-1.4.29.tar.gz
+sha256	e0bea597c9082557f3357f63db08c3d5121ccc8502f300a48d4cb84d22e8be5f	memcached-1.4.30.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 42742ff..b40ca84 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.29
+MEMCACHED_VERSION = 1.4.30
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
