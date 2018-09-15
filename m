From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Sep 2018 22:52:52 +0200
Subject: [Buildroot] [PATCH 1/1] memcached: bump to version 1.5.10
Message-ID: <20180915205252.11210-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memcached/memcached.hash | 9 ++++++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 8278933827..c3cc11c3b4 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,3 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.5.6.tar.gz.sha1
-sha1 ca35929e74b132c2495a6957cfdc80556337fb90  memcached-1.5.6.tar.gz
-sha256 9675ee859d7d81f7a950f190a6812720b26f08228d356044ec517d4d5af25f03  memcached-1.5.6.tar.gz
+# From http://www.memcached.org/files/memcached-1.5.10.tar.gz.sha1
+sha1 fff9351b360a09497cd805d3e4c1ffbe860d067d  memcached-1.5.10.tar.gz
+
+# Locally computed
+sha256 494c060dbd96d546c74ab85a3cc3984d009b4423767ac33e05dd2340c01f1c4b  memcached-1.5.10.tar.gz
+sha256 bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index c15abc79bf..f591fcf1c3 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.5.6
+MEMCACHED_VERSION = 1.5.10
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.17.1
