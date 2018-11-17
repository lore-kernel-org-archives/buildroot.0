From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Nov 2018 14:35:47 +0100
Subject: [Buildroot] [PATCH/next 1/1] memcached: bump to version 1.5.12
Message-ID: <20181117133547.8075-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index c3cc11c3b4..df430cf4ff 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.5.10.tar.gz.sha1
-sha1 fff9351b360a09497cd805d3e4c1ffbe860d067d  memcached-1.5.10.tar.gz
+# From http://www.memcached.org/files/memcached-1.5.12.tar.gz.sha1
+sha1 f67096ba64b0c47668bcad5b680010c4f8987d4c  memcached-1.5.12.tar.gz
 
 # Locally computed
-sha256 494c060dbd96d546c74ab85a3cc3984d009b4423767ac33e05dd2340c01f1c4b  memcached-1.5.10.tar.gz
+sha256 c02f97d5685617b209fbe25f3464317b234d765b427d254c2413410a5c095b29  memcached-1.5.12.tar.gz
 sha256 bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index f591fcf1c3..b7c36ec155 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.5.10
+MEMCACHED_VERSION = 1.5.12
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.17.1
