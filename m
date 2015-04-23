From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Apr 2015 02:42:23 -0300
Subject: [Buildroot] [PATCH] memcached: bump to version 1.4.23
Message-ID: <1429767743-5666-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/memcached/memcached.hash | 4 ++--
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 98e572d..45e1db5 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,2 +1,2 @@
-# From http://www.memcached.org/files/memcached-1.4.22.tar.gz.sha1
-sha1	5968d357d504a1f52622f9f8a3e85c29558acaa5	memcached-1.4.22.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.23.tar.gz.sha1
+sha1	121fc548860f4e7d4d5052f9816cc6ff4cc5a10d	memcached-1.4.23.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 8a005d4..3c67da0 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.22
+MEMCACHED_VERSION = 1.4.23
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.0.5
