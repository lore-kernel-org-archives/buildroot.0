From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Aug 2016 22:28:59 -0300
Subject: [Buildroot] [PATCH] memcached: bump to version 1.4.30
Message-ID: <1471397339-31204-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
