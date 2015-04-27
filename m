From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:30:41 +0200
Subject: [Buildroot] [git commit] memcached: bump to version 1.4.24
Message-ID: <20150427213049.7B95B81D53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=968cf1fc8df2eaea0ddc8e03fea09bbd4f143249
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/memcached/memcached.hash |    4 ++--
 package/memcached/memcached.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 45e1db5..55376ce 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,2 +1,2 @@
-# From http://www.memcached.org/files/memcached-1.4.23.tar.gz.sha1
-sha1	121fc548860f4e7d4d5052f9816cc6ff4cc5a10d	memcached-1.4.23.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.24.tar.gz.sha1
+sha1	32a798a37ef782da10a09d74aa1e5be91f2861db	memcached-1.4.24.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 3c67da0..2d39bd8 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.23
+MEMCACHED_VERSION = 1.4.24
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
