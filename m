From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 13:18:35 +0100
Subject: [Buildroot] [git commit branch/next] lttng-libust: bump to version
	2.7.1
Message-ID: <20151127122053.56AE081F88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d2e7e4e38842a383457fdfe43397653e6ee1f4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-libust/lttng-libust.hash |    4 ++--
 package/lttng-libust/lttng-libust.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index aafc2ba..57c7e00 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,2 +1,2 @@
-# http://www.lttng.org/files/lttng-ust/lttng-ust-2.6.2.tar.bz2.sha1
-sha1  bfa9cbdabd8698cf5b98667eac5c39775127f634  lttng-ust-2.6.2.tar.bz2
+# http://www.lttng.org/files/lttng-ust/lttng-ust-2.7.1.tar.bz2.sha1
+sha1  597ebecb885debb58c263de57f30b1096d4eefc6  lttng-ust-2.7.1.tar.bz2
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 4976ff4..cfd2367 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.6.2
+LTTNG_LIBUST_VERSION = 2.7.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
