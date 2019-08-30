From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 30 Aug 2019 11:40:34 -0700
Subject: [Buildroot] [PATCH] package/memcached: bump to version 1.5.16
In-Reply-To: <20190830184034.26771-1-chrismcc@gmail.com>
References: <20190830184034.26771-1-chrismcc@gmail.com>
Message-ID: <20190830184034.26771-3-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index df430cf4ff..11fc740b85 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.5.12.tar.gz.sha1
-sha1 f67096ba64b0c47668bcad5b680010c4f8987d4c  memcached-1.5.12.tar.gz
+# From http://www.memcached.org/files/memcached-1.5.16.tar.gz.sha1
+sha1 06a9661638cb20232d0ccea088f52ca10b959968  ./memcached-1.5.16.tar.gz
 
 # Locally computed
-sha256 c02f97d5685617b209fbe25f3464317b234d765b427d254c2413410a5c095b29  memcached-1.5.12.tar.gz
+sha256 45a22c890dc1edb27db567fb4c9c25b91bfd578477c08c5fb10dca93cc62cc5a  memcached-1.5.16.tar.gz
 sha256 bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index b7c36ec155..938a4a1bbd 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.5.12
+MEMCACHED_VERSION = 1.5.16
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.20.1
