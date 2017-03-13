From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 13 Mar 2017 11:43:50 +0000
Subject: [Buildroot] [PATCH] memcached: bump version to 1.4.35
Message-ID: <20170313114350.36178-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 11cac3a..3876a08 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.34.tar.gz.sha1
-sha1	7c7214f5183c6e20c22b243e21ed1ffddb91497e	memcached-1.4.34.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.35.tar.gz.sha1
+sha1 787991c0df75defbb91518c9796f8244852a018a  memcached-1.4.35.tar.gz
 # Calculated based on the hash above
-sha256	5064c87f91a37d822dfeab8768490c55fe686a742f07f67c7121101e48d87c79	memcached-1.4.34.tar.gz
+sha256 f4815ac95aa06c0f360052a0a12010533b2b78c3bfe475b171606c1b61469476  memcached-1.4.35.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index caebe02..83d4d59 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.34
+MEMCACHED_VERSION = 1.4.35
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.10.2
