From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 12:58:30 +0100
Subject: [Buildroot] [git commit] memcached: bump to version 1.4.34
Message-ID: <20170109121712.85328818DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3413191dcc667cf26ea6a012b386e65166f99589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 256442a..11cac3a 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.33.tar.gz.sha1
-sha1	e343530c55946ccbdd78c488355b02eaf90b3b46	memcached-1.4.33.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.34.tar.gz.sha1
+sha1	7c7214f5183c6e20c22b243e21ed1ffddb91497e	memcached-1.4.34.tar.gz
 # Calculated based on the hash above
-sha256	83726c8d68258c56712373072abb25a449c257398075a39ec0867fd8ba69771d	memcached-1.4.33.tar.gz
+sha256	5064c87f91a37d822dfeab8768490c55fe686a742f07f67c7121101e48d87c79	memcached-1.4.34.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 74cf6b8..caebe02 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.33
+MEMCACHED_VERSION = 1.4.34
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
