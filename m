From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Aug 2016 15:47:00 +0200
Subject: [Buildroot] [git commit] memcached: bump to version 1.4.31
Message-ID: <20160902142939.E3D307FEE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f04e0136d1a9fa77e0085398c77e316237dca5ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index b1353b2..918a36b 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.30.tar.gz.sha1
-sha1	bb8644a4110932e331d1539f0435bc6a0e558827	memcached-1.4.30.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.31.tar.gz.sha1
+sha1	3ea34f5bc5c5aacb76cfc07f4ee5847f33526cb6	memcached-1.4.31.tar.gz
 # Calculated based on the hash above
-sha256	e0bea597c9082557f3357f63db08c3d5121ccc8502f300a48d4cb84d22e8be5f	memcached-1.4.30.tar.gz
+sha256	77ce5f820bafe94c33bf7bd86268d9bcdb3b76f68128d795b106db53d528707f	memcached-1.4.31.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index b40ca84..4099428 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.30
+MEMCACHED_VERSION = 1.4.31
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
