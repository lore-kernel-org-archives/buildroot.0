From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  1 Aug 2014 11:27:23 +0200
Subject: [Buildroot] [PATCH 1/1] libmemcached: unification of name
	<PKG>_VERSION_MAJOR variable
Message-ID: <1406885243-21453-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libmemcached/libmemcached.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index fd5b418..070951a 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBMEMCACHED_MAJOR_VERSION = 1.0
-LIBMEMCACHED_VERSION = $(LIBMEMCACHED_MAJOR_VERSION).18
-LIBMEMCACHED_SITE = http://launchpad.net/libmemcached/$(LIBMEMCACHED_MAJOR_VERSION)/$(LIBMEMCACHED_VERSION)/+download
+LIBMEMCACHED_VERSION_MAJOR = 1.0
+LIBMEMCACHED_VERSION = $(LIBMEMCACHED_VERSION_MAJOR).18
+LIBMEMCACHED_SITE = http://launchpad.net/libmemcached/$(LIBMEMCACHED_VERSION_MAJOR)/$(LIBMEMCACHED_VERSION)/+download
 LIBMEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBMEMCACHED_CONF_OPT = --disable-dtrace
 LIBMEMCACHED_INSTALL_STAGING = YES
-- 
1.7.9.5
