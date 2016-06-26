From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 21:45:51 +0200
Subject: [Buildroot] [git commit] memcached: bump to version 1.4.27
Message-ID: <20160626194641.2DD76803DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a5a4e16d03481be3654576cacfdd4d52e7aef0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 096431c..99ee9ac 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.26.tar.gz.sha1
-sha1	f0d4f89ead2ac48c6b9e8070178279c0a3d45559	memcached-1.4.26.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.27.tar.gz.sha1
+sha1	b5869038dc5f2dce24f3a62806eadfd64d58662e	memcached-1.4.27.tar.gz
 # Calculated based on the hash above
-sha256	4a67800277eec2e523c51d5f620c416e7d0acfde90beacaa26d8e4f6976b43f6	memcached-1.4.26.tar.gz
+sha256	96a90e7abec041a3c03258b6ce01ab21be16a9c594b7891a55567428392e8fe7	memcached-1.4.27.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index bab5a84..37e52ad 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.26
+MEMCACHED_VERSION = 1.4.27
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
