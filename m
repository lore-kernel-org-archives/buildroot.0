From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Aug 2017 11:52:53 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/memcached: bump version to
	1.5.0
Message-ID: <20170805095253.27442-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 1a88cc728..204590d27 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.37.tar.gz.sha1
-sha1 6a6c2ab70e9470fef939afff1cb58b7602077611  memcached-1.4.37.tar.gz
+# From http://www.memcached.org/files/memcached-1.5.0.tar.gz.sha1
+sha1 e12af93e63c05ab7e89398e4cfd0bfc7b7bff1c5  memcached-1.5.0.tar.gz
 # Calculated based on the hash above
-sha256 2f335ab9110ce39036c5271ef39a582a852e424bc9659e421844073cfdf8606b  memcached-1.4.37.tar.gz
+sha256 c001f812024bb461b5e4d7d0506daab63dff9614eea26f46536c3b7e1e601c32  memcached-1.5.0.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 087be570a..d0e3bc01d 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.37
+MEMCACHED_VERSION = 1.5.0
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.11.0
