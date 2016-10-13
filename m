From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Oct 2016 07:25:07 -0300
Subject: [Buildroot] [PATCH] memcached: bump to version 1.4.32
Message-ID: <1476354307-3881-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 918a36b..dbc0c0d 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.31.tar.gz.sha1
-sha1	3ea34f5bc5c5aacb76cfc07f4ee5847f33526cb6	memcached-1.4.31.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.32.tar.gz.sha1
+sha1	cbec6b533fe037b5ad5c54d111e0d30bc9db4424	memcached-1.4.32.tar.gz
 # Calculated based on the hash above
-sha256	77ce5f820bafe94c33bf7bd86268d9bcdb3b76f68128d795b106db53d528707f	memcached-1.4.31.tar.gz
+sha256	54bb9acd5fbbb73cd1fbfa67cbc6b301009a2835a26c8a4c3dba634a0c3d875d	memcached-1.4.32.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 4099428..2d84574 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.31
+MEMCACHED_VERSION = 1.4.32
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.7.3
