From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 10:43:27 +0200
Subject: [Buildroot] [git commit] libmemcached: unification of name
	<PKG>_VERSION_MAJOR variable
Message-ID: <20140803084505.AF4B79D11D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21205fced532ff875b32e9492e67e0a1908598d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmemcached/libmemcached.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
