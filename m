From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Jul 2016 07:46:01 -0300
Subject: [Buildroot] [PATCH] memcached: bump to version 1.4.29
Message-ID: <1468493161-27535-1-git-send-email-gustavo@zacarias.com.ar>
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
index e774a61..ab57b51 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.28.tar.gz.sha1
-sha1	c27662ca84933f5ebd837a86dde9378d05c1f200	memcached-1.4.28.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.29.tar.gz.sha1
+sha1	8994b4d0dbcc8d536f3d6cd4763489a3c51ca44b	memcached-1.4.29.tar.gz
 # Calculated based on the hash above
-sha256	ef847bba60301cc600f06a8c64bf91c6c3f65ca507462951f918963297bcb816	memcached-1.4.28.tar.gz
+sha256	c61a3a7f9c82e574559797bbf4bb01ad8b79e436ca80b8e46f5b51ae39b03d0b	memcached-1.4.29.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 6490271..42742ff 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.28
+MEMCACHED_VERSION = 1.4.29
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.7.3
