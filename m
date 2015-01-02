From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jan 2015 12:07:24 +0100
Subject: [Buildroot] [git commit] memcached: bump to version 1.4.22
Message-ID: <20150102110750.746E580806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=607f5116f7a26f4cbb95d97fe477bb2074e34f0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memcached/memcached.hash |    4 ++--
 package/memcached/memcached.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 7acbaf4..98e572d 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,2 +1,2 @@
-# From http://www.memcached.org/files/memcached-1.4.21.tar.gz.sha1
-sha1	ab10c46dd9f5d4401872d9670e575afa5bc7d66f	memcached-1.4.21.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.22.tar.gz.sha1
+sha1	5968d357d504a1f52622f9f8a3e85c29558acaa5	memcached-1.4.22.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index c057d57..8a005d4 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.21
+MEMCACHED_VERSION = 1.4.22
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
