From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 07:16:39 +0100
Subject: [Buildroot] [git commit] memcached: bump to version 1.4.25
Message-ID: <20151201232122.C446381952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02bd8520e801bc1adb4120c8c05a8cfba9090ab3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memcached/memcached.hash | 6 ++++--
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 55376ce..ed330cf 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,2 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.24.tar.gz.sha1
-sha1	32a798a37ef782da10a09d74aa1e5be91f2861db	memcached-1.4.24.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.25.tar.gz.sha1
+sha1	7fd0ba9283c61204f196638ecf2e9295688b2314	memcached-1.4.25.tar.gz
+# Calculated based on the hash above
+sha256	f058437b3c224d321919a9a6bb4e3eedb2312ed718c0caf087ff2f04ab795dda	memcached-1.4.25.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 2d39bd8..b0753e4 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.24
+MEMCACHED_VERSION = 1.4.25
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
